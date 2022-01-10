# frozen_string_literal: true

require 'dry/files'

module GOBL
  module Tax
    class Loader
      # Make a singleton
      @instance = new
      private_class_method :new

      def self.region(code)
        regions[code] ||= @instance.region(code)
      end

      def self.files
        @files ||= Dry::Files.new
      end

      def self.expand_path(file)
        files.join("#{__dir__}/../../../schema/tax/data", file)
      end

      # map of region ID to region instance
      def self.regions
        @regions ||= {}
      end

      def region(code)
        load_region(code)
      end

      protected

      def load_region(code)
        path = Loader.expand_path("#{code}.json")
        msg = "region definition for #{code} does not exist at #{path}"
        raise StandardError, msg unless Loader.files.exist?(path)

        data = Loader.files.read(path)
        GOBL::Tax::Region.from_json!(data)
      end
    end
  end
end
