# frozen_string_literal: true

module GOBL
  module Extensions
    module Bill
      # Additional methods for the generated {GOBL::Bill::Invoice} class
      module InvoiceHelper
        def self.included(klass)
          klass.alias_method :tags, '$tags'
          klass.alias_method :tags=, '$tags='
        end

        # Returns the applicable regime based on the supplier’s tax ID
        def regime
          regime_country && GOBL::Tax::RegimeDef.fetch(regime_country)
        end

        private

        def regime_country
          supplier&.tax_id&.country
        end
      end
    end
  end
end
