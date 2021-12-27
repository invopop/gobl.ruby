# frozen_string_literal: true

require_relative 'renderer'

class Generator
  # Exporter - Object that creates files for in-memory objects.
  class Exporter
    attr_reader :catalog, :lang

    def initialize(catalog, lang)
      @catalog = catalog
      @lang = lang
    end

    def register(name, klass)
      registry[name] = Renderer::Klass.for(klass, self, lang: lang)
    end

    def lookup(name)
      registry[name]&.klass
    end

    def export_all(root_dir)
      return unless root_dir

      registry.each_value { |renderer| export(renderer, root_dir) }
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

    def save(renderer, filepath)
      f = File.new(filepath, 'w')
      f.write(renderer.to_text)
      f.close
    end

    def export(renderer, root_dir)
      filepath = renderer.klass.to_s.split('::').map do |segment|
        catalog.path_name(segment)
      end

      dir = filepath.unshift(root_dir).join('/')
      save(renderer, "#{mkdir(dir)}.rb")
    end
  end
end