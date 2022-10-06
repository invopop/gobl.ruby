# frozen_string_literal: true

module GOBL
  # Provides the API to execute operations over GOBL structures. It implements them by
  # sending HTTP requests to the bulk endpoint of the service that the GOBL CLI makes
  # available via the `gobl serve` command. The server's host and port must be configured
  # using `GOBL.config.service_host` and `GOBL.config.service_port`.
  #
  # @example
  #   GOBL.config.service_host = 'localhost'
  #   GOBL.config.service_port = 8080
  #
  #   doc = GOBL::Document.new(
  #     '$schema' => 'https://gobl.org/draft-0/bill/invoice',
  #     'code' => 'SAMPLE-001',
  #     'currency' => 'EUR',
  #     'issue_date' => '2022-02-01',
  #     'supplier' => { 'tax_id' => { 'country' => 'ES', 'code' => '54387763P' }, 'name' => 'Provide One S.L.' },
  #     'customer' => { 'tax_id' => { 'country' => 'ES', 'code' => '54387763P' }, 'name' => 'Sample Consumer' },
  #     'lines' => [ { 'quantity' => '20', 'item' => { 'name' => 'Development services', 'price' => '90.00' } } ]
  #   )
  #
  #   built_doc = GOBL.build(doc)
  #
  #   invoice = built_doc.extract
  #   invoice.totals.total.to_s #=> "1800.00"
  module Operations
    # @api private
    VALIDATABLE_TYPES = SIGNABLE_TYPES = BUILDABLE_TYPES = [
      GOBL::Document,
      GOBL::Envelope
    ].freeze

    # Calculates and validates an envelope or document, wrapping it in an envelope if
    # requested.
    #
    # @param struct [GOBL::Document, GOBL::Envelope] the document or envelope to build.
    # @param envelop [Boolean] whether the operation should envelop the document.
    # @param draft [Boolean] whether the envelope should be flagged as a draft.
    #
    # @return [GOBL::Envelope, GOBL::Document] a built envelope or document.
    #
    # @raise [GOBL::Operations::ServiceError] if the service returns any errors.
    #
    # @example Build a document without enveloping it.
    #   invoice = GOBL::Document.from_json!(File.read('invoice.json'))
    #   GOBL.build(invoice) #=> A new, calculated `GOBL::Document`
    #
    # @example Build a document and wrap in a draft envelope.
    #   invoice = GOBL::Document.from_json!(File.read('invoice.json'))
    #   GOBL.build(invoice, envelop: true) #=> A calculated, draft `GOBL::Envelope`
    #
    # @example Build a document and wrap in a non-draft envelope.
    #   invoice = GOBL::Document.from_json!(File.read('invoice.json'))
    #   GOBL.build(invoice, envelop: true, draft: false) #=> A calculated, non-draft `GOBL::Envelope`
    #
    # @example Build an envelope.
    #   envelope = GOBL::Envelop.from_json!(File.read('envelope.json'))
    #   GOBL.build(envelope) #=> A new, calculated GOBL::Envelope
    #
    # @example Build an envelope forcing it to be a non-draft.
    #   envelope = GOBL::Envelop.from_json!(File.read('draft_envelope.json'))
    #   GOBL.build(envelope, draft: false) #=> A new, non-draft GOBL::Envelope
    def build(struct, envelop: nil, draft: nil)
      check_struct_type struct, BUILDABLE_TYPES

      response = request_action(:build, struct: struct,
                                        envelop: envelop,
                                        draft: draft)

      raise ServiceError, response['error'] if response['error'].present?

      GOBL::Struct.from_data response['payload']
    end

    # Checks whether or not a document or envelope is valid according to the GOBL schema
    #   and rules.
    #
    # @param struct [GOBL::Document, GOBL::Envelope] the document or the envelope to
    #   validate.
    #
    # @return [GOBL::ValidationResult] the result of the validations.
    #
    # @example Validate an invalid document.
    #   document =  GOBL::Document.from_json!(File.read('invalid_invoice.json'))
    #   result = GOBL.validate(document)
    #   result.valid? #=> false
    #   result.errors #=> ['code: cannot be blank', 'totals: cannot be blank']
    #
    # @example Validate a valid envelope.
    #   envelope = GOBL::Envelop.from_json!(File.read('valid_envelope.json'))
    #   result = GOBL.validate(envelope)
    #   result.valid? #=> true
    #   result.errors #=> []
    def validate(struct)
      check_struct_type struct, VALIDATABLE_TYPES

      response = request_action(:validate, struct: struct)

      if response['error'].present?
        ValidationResult.from_service_error(response['error'])
      elsif response['payload']['ok']
        ValidationResult.valid
      else
        raise 'Unexpected response from the service'
      end
    end

    # Signs a document or envelope, calculating, enveloping and validating it first if
    #   needed. The signing key will be the one configured in the server.
    #
    # @param struct [GOBL::Document, GOBL::Envelope] the envelop or document to sign.
    #
    # @return [GOBL::Envelope] a signed envelope.
    #
    # @raise [GOBL::Operations::ServiceError] if the service returns any errors.
    #
    # @example Sign an envelope.
    #   envelope = GOBL::Envelop.from_json!(File.read('draft_envelope.json'))
    #   GOBL.sign(envelope) #=> A new signed GOBL::Envelope
    def sign(struct)
      check_struct_type struct, SIGNABLE_TYPES

      response = request_action(:sign, struct: struct)

      raise ServiceError, response['error'] if response['error'].present?

      GOBL::Struct.from_data response['payload']
    end

    private

    # Sends a request action to the GOBL service using the bulk endpoint. This endpoint
    # allows to send multiple actions in one request but we only use it with one action.
    def request_action(action, struct:, **params)
      request = build_bulk_request(action, struct, params)

      response = Net::HTTP.post(bulk_endpoint, request)
      response.error! unless response.is_a?(Net::HTTPSuccess)

      parts = parse_bulk_response(response)
      parts.first # We're only requesting one action, the response is the first part
    end

    def build_bulk_request(action, struct, params)
      payload = params.merge(data: Base64.encode64(struct.to_json.to_s))

      { action: action, payload: payload }.to_json
    end

    def bulk_endpoint
      @bulk_endpoint ||= URI::HTTP.build(
        host: GOBL.config.service_host,
        port: GOBL.config.service_port,
        path: '/bulk'
      )
    end

    def parse_bulk_response(response)
      response.body.split("\n").map { |row| JSON.parse(row) }
    end

    def check_struct_type(struct, allowed_types)
      return if allowed_types.any? { |klass| struct.is_a?(klass) }

      message = "This operation only supports #{allowed_types.join(', ')} structs"
      raise ArgumentError, message
    end
  end
end
