# frozen_string_literal: true

module GOBL
  module Extensions
    module Bill
      # Aggregates the data of collection of scenarios
      class ScenarioSummary
        def initialize(scenarios)
          @scenarios = scenarios
        end

        # Returns the aggregated codes of the scenarios
        def codes
          scenarios.inject({}) do |codes, scenario|
            codes.merge(scenario.codes.to_h)
          end
        end

        private

        attr_reader :scenarios
      end
    end
  end
end
