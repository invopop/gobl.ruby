# frozen_string_literal: true

module GOBL
  module Operations
    # Wraps an error returned by the backend GOBL service when attempting to run an
    # operation
    class ServiceError < StandardError
    end
  end
end
