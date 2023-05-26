# frozen_string_literal: true

module GOBL
  module Extensions
    module Bill
      # Aggregates the data of collection of scenarios
      class ScenarioSummary
        def initialize(scenarios)
          @scenarios = scenarios
        end

        # Returns the aggregated metadata of the scenarios
        def meta
          scenarios.inject({}) do |meta, scenario|
            meta.merge(scenario.meta.to_h)
          end
        end

        private

        attr_reader :scenarios
      end
    end
  end
end
