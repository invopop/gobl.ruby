# frozen_string_literal: true

module GOBLExtensions
  module Tax
    # Additional methods for the generated {GOBL::Tax::Regime} class
    module RegimeHelper
      module ClassMethods
        # Loads a {GOBL::Tax::Regime} object identified by the given code with all its data
        #
        # @param code [String] the code of the regime to load
        #
        # @return [Regime] the requested regime
        def fetch(code)
          regimes[code] ||= load_regime(code)
        end

        protected

        # map of regime ID to regime instance
        def regimes
          @regimes ||= {}
        end

        def load_regime(code)
          path = File.join("#{__dir__}/../../../data/regimes", "#{code.to_s.downcase}.json")
          msg = "regime definition for #{code} does not exist at #{path}"
          raise StandardError, msg unless File.exist?(path)

          data = File.read(path)
          from_json!(data)
        end
      end
    end
  end
end
