# frozen_string_literal: true

require_relative '../renderable'
require_relative 'schema'

class Generator
  module Renderer
    # Klass - Abstract class which defines the core behaviour of a specific
    # language renderer.
    class Klass
      include Renderable

      def initialize(klass, exporter)
        @klass = klass
        @exporter = exporter
      end

      def self.inherited(subclass)
        super
        renderer_map[subclass] = subclass
      end

      def self.renderer_map
        @renderer_map ||= {}
      end

      def self.for(lang, *args)
        key = renderer_map.keys.find { |kls| kls.lang == lang }
        renderer_map[key]&.new(*args)
      end
    end
  end
end
