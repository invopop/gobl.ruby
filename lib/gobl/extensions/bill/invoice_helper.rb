# frozen_string_literal: true

module GOBL
  module Extensions
    module Bill
      # Additional methods for the generated {GOBL::Bill::Invoice} class
      module InvoiceHelper
        # Returns the applicable regime based on the supplier’s tax ID
        def regime
          regime_country && GOBL::Tax::Regime.fetch(regime_country)
        end

        # Returns the invoice’s scenario summary which aggregates the data of
        # the matching regime’s scenarios
        def scenario_summary
          ScenarioSummary.new(matching_scenarios)
        end

        private

        def regime_country
          supplier&.tax_id&.country
        end

        def matching_scenarios
          return [] unless scenario_set

          scenario_set.list.select do |scenario|
            matches_scenario?(scenario)
          end
        end

        def matches_scenario?(scenario)
          matches_scenario_tags?(scenario) && matches_scenario_type?(scenario)
        end

        def matches_scenario_type?(scenario)
          scenario.type.blank? || scenario.type.include?(type)
        end

        def matches_scenario_tags?(scenario)
          scenario_tags = scenario.tags || []
          tax_tags = tax&.tags || []

          (scenario_tags - tax_tags).empty?
        end

        def scenario_set
          regime&.scenarios&.find do |scenario_set|
            self.class::SCHEMA_ID.include?(scenario_set.schema)
          end
        end
      end
    end
  end
end
