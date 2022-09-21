# frozen_string_literal: true

module GOBL
  # Provides accessors to the library's configuration settings
  class Config
    # The host of the GOBL CLI service to use by {GOBL::Operations}
    # @return [String] the backend service's host
    attr_accessor :service_host

    # The port of the GOBL CLI service to use by {GOBL::Operations}
    # @return [String, Integer] the backend service's port
    attr_accessor :service_port
  end
end
