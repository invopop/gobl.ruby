# frozen_string_literal: true

module GOBL
  module Extensions
    module Tax
      # Additional methods for the generated {GOBL::Tax::Regime} class
      module AddonHelper
        module ClassMethods
          # Loads a {GOBL::Tax::Regime} object identified by the given code with all its data
          #
          # @param code [String] the code of the regime to load
          #
          # @return [Regime] the requested regime
          def fetch(code)
            addons[code] ||= load_addon(code)
          end

          protected

          # map of regime ID to regime instance
          def addons
            @addons ||= {}
          end

          def load_addon(code)
            path = File.join("#{__dir__}/../../../../data/addons", "#{code.to_s.downcase}.json")
            msg = "addon definition for #{code} does not exist at #{path}"
            raise StandardError, msg unless File.exist?(path)

            data = File.read(path)
            from_json!(data)
          end
        end
      end
    end
  end
end
