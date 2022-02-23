# frozen_string_literal: true

require 'dry/files'

module GOBLExtensions
  module Tax
    # Class methods used to load a region
    module RegionHelper
      def fetch(code)
        regions[code] ||= load_region(code)
      end

      protected

      def files
        @files ||= Dry::Files.new
      end

      # map of region ID to region instance
      def regions
        @regions ||= {}
      end

      def load_region(code)
        path = files.join("#{__dir__}/../../../data/tax", "#{code}.json")
        msg = "region definition for #{code} does not exist at #{path}"
        raise StandardError, msg unless files.exist?(path)

        data = files.read(path)
        from_json!(data)
      end
    end
  end
end
