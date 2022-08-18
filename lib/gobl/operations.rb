module GOBL
  module Operations
    #
    # Calculates and validates a document or envelop, wrapping it in an envelope if needed
    #
    # @param struct [GOBL::Document, GOBL::Envelope] the document or an envelope with the document to
    #   build
    # @param envelop [Boolean] if the struct is a document, whether the operation will wrap it in an
    #   envelope
    # @param draft [Boolean] if the return value is a envelope, whether that envelope should be
    #   flagged as a draft
    #
    # @return [GOBL::Envelope, GOBL::Document] a calculated and validated envelope or document
    #   (depending on the other parameters)
    #
    # @raise [GOBL::InvalidDocumentException] if the document is invalid after the calculation.
    #
    # @example Build a document without enveloping it
    #   invoice = GOBL::Bill::Invoice.new(…)
    #   GOBL.build(invoice) #=> A new, calculated GOBL::Bill::Invoice
    #
    # @example Build a document and wrap in a draft envelope
    #   invoice = GOBL::Bill::Invoice.new(…)
    #   GOBL.build(invoice, envelop: true) #=> A calculated, draft GOBL::Envelope
    #
    # @example Build a document and wrap in a non-draft envelope
    #   invoice = GOBL::Bill::Invoice.new(…)
    #   GOBL.build(invoice, envelop: true, draft: false) #=> A calculated, non-draft GOBL::Envelope
    #
    # @example Build an envelope
    #   envelope = GOBL::Envelop.new(…)
    #   GOBL.build(envelope) #=> A new, calculated GOBL::Envelope
    #
    # @example Build an envelope forcing it to be a non-draft
    #   envelope = GOBL::Envelop.new(…)
    #   GOBL.build(envelope, draft: false) #=> A new, non-draft GOBL::Envelope
    #
    def build(struct, envelop: false, draft: true)
    end

    #
    # Checks whether a document or envelope is valid according to the GOBL schema and rules
    #
    # @param struct [GOBL::Document, GOBL::Envelope] the document or the envelope to validate
    #
    # @return [GOBL::ValidationResult] the result of the validations
    #
    # @example Validate an invalid document
    #   invoice = GOBL::Bill::Invoice.new(…)
    #   result = GOBL.validate(invoice)
    #   result.valid? #=> false
    #   result.errors #=> ['code: cannot be blank', 'totals: cannot be blank']
    #
    # @example Validate a valid envelope
    #   envelope = GOBL::Envelop.new(…)
    #   result = GOBL.validate(envelope)
    #   result.valid? #=> true
    #   result.errors #=> []
    def validate(struct)
    end

    #
    # Signs a document or envelope, calculating, enveloping and validating it first if needed
    #
    # @param struct [GOBL::Document, GOBL::Envelope] the envelop or document to sign. If a document
    #   is given, it will be calculated, validated and enveloped.
    # @param key [GOBL::DSig::PrivateKey] the private key to be used to
    #
    # @return [GOBL::Envelope] a signed envelope
    #
    # @raise [GOBL::InvalidDocumentException] if the document is invalid after the calculation.
    #
    # @example Sign an envelope
    #   envelope = GOBL::Envelope.new(…)
    #   GOBL.sign(envelope) #=> A new GOBL::Envelope signed with the default key
    #
    # @example Sign a document with a custom key
    #   invoice = GOBL::Bill::Invoice.new(…)
    #   key = GOBL::DSig::PrivateKey.new(ENV['GOBL_PRIVATE_JWK'])
    #   GOBL.sign(invoice, key: key) #=> A GOBL::Envelope with the calculated document signed with the given key
    #
    def sign(struct, key: GOBL::Config.default_private_key)
    end

    #
    # Verifies that a signed envelope is valid against a public key
    #
    # @param envelope [GOBL::Envelope] the envelope to verify
    # @param key [GOBL::DSig::PublicKey] the public key to check the envelope against
    #
    # @return [GOBL::ValidationResult] the result of the verification
    #
    # @example Verify an envelop signed with a mismatching key
    #   envelope = GOBL::Envelope.new(…)
    #   key = GOBL::DSig::PublicKey.new(ENV['GOBL_PUBLIC_JWK'])
    #   result = GOBL.verify(envelope, key: key)
    #   result.valid? #=> false
    #   result.errors #=> ['key mismatch']
    #
    # @example Succesful verification using the default public key
    #   envelope = GOBL::Envelope.new(…)
    #   result = GOBL.verify(envelope)
    #   result.valid? #=> true
    #   result.errors #=> []
    #
    def verify(envelope, key: GOBL::Config.default_public_key)
    end
  end
end
