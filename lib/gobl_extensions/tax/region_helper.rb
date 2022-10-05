# frozen_string_literal: true

module GOBLExtensions
  module Tax
    # Additional methods for the generated {GOBL::Tax::Region} class
    module RegionHelper
      module ClassMethods
        # Loads a {GOBL::Tax::Region} object identified by the given code with all its data
        #
        # @param code [String] the code of the region to load
        #
        # @return [Region] the requested region
        def fetch(code)
          regions[code] ||= load_region(code)
        end

        protected

        # map of region ID to region instance
        def regions
          @regions ||= {}
        end

        def load_region(code)
          path = File.join("#{__dir__}/../../../data/tax", "#{code}.json")
          msg = "region definition for #{code} does not exist at #{path}"
          raise StandardError, msg unless File.exist?(path)

          data = File.read(path)
          from_json!(data)
        end
      end
    end
  end
end
