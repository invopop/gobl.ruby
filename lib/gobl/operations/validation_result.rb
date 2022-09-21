# frozen_string_literal: true

module GOBL
  module Operations
    # The result of a GOBL validation over a GOBL structure
    class ValidationResult
      SERVICE_ERROR_REGEX = /^code=(?<code>\d+), message=(?<msg>.+)$/.freeze # @api private

      def initialize(errors)
        @errors = errors
      end

      # Whether the GOBL structure were valid or not
      #
      # @return [Boolean]
      def valid?
        @errors.empty?
      end

      # The list of errors found in the GOBL structure
      #
      # @return [Array]
      def errors
        @errors || []
      end

      # Builds a new `ValidationResult` object resulted from parsing the service
      #   error response given as a parameter
      #
      # @param service_error [String]
      # @return [ValidationResult]
      def self.from_service_error(service_error)
        message = service_error.match(SERVICE_ERROR_REGEX)[:msg]
        errors = message.split('; ')
        new errors
      end

      # Builds a new `ValidationResult` object for a positive `validate` operation
      #
      # @return [ValidationResult]
      def self.valid
        new []
      end
    end
  end
end
