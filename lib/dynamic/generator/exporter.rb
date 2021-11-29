# frozen_string_literal: true

require_relative 'renderer'

module Dynamic
  class Generator
    # Exporter - Object that creates files for in-memory objects.
    class Exporter
      attr_reader :catalog, :lang

      def initialize(catalog, lang)
        @catalog = catalog
        @lang = lang
      end

      def register(name, klass)
        registry[name] = Renderer.for(lang, klass, self)
      end

      def lookup(name)
        registry[name]&.klass
      end

      def export_all(root_dir)
        return unless root_dir

        registry.each_value { |render| export(render, root_dir) }
      end

      private

      def registry
        @registry ||= {}
      end

      def mkdir(dir)
        dir.split('/').inject do |filepath, path|
          Dir.mkdir(filepath) unless File.exist?(filepath)
          [filepath, path].join('/')
        end
      end

      def save(render, path)
        filepath = "#{path}.rb"

        f = File.new(filepath, 'w')
        f.write(render.to_text)
        f.close
      end

      def export(render, root_dir)
        filepath = render.klass.to_s.split('::').map do |segment|
          catalog.path_name(segment)
        end

        dir = filepath.unshift(root_dir).join('/')
        save(render, mkdir(dir))
      end
    end
  end
end
