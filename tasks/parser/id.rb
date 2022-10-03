# frozen_string_literal: true

module Parser
  # ID is used to simplify URL parsing. The JSON Schema `$id` field must always be a
  # fully qualified URL. This class adds special support for parsing GOBL URLs.
  # TODO: reuse the GOBL::ID.
  class ID
    def initialize(id)
      @id = URI.parse(id)
    end

    def gobl?
      @id.host == 'gobl.org'
    end

    # Fragment defines the fragment part of the URL, without the '#'. This is
    # usually used with schema references.
    def fragment
      @id.fragment
    end

    # version provides the GOBL schema version, the first part of the URI path.
    def version
      @id.path.split('/')[1]
    end

    # The name is the last element of a path.
    def name
      @id.path.split('/').last
    end

    # Provides the module component of the path, which may be empty. The
    # last element of the path is always considered the name of the current schema,
    # and not the module.
    # Multiple modules will be sperated by "/".
    def module
      @id.path.split('/')[2..-2].join('/')
    end

    def to_s
      @id.to_s
    end

    def ==(other)
      to_s == other.to_s
    end
  end
end
