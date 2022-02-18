require 'uri'

module GOBL
  # Provide a wrapper around Schema IDs (URLs) so that it's easy
  # to extract the type of document we're dealing with.
  class ID
    def initialize(val)
      @id = URI.parse(val)
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

    # Provides the module components of the path, which may be empty. The
    # last element of the path is always considered the name of the current schema,
    # and not the module.
    def modules
      @id.path.split('/')[2..-2]
    end

    # Multiple modules will be sperated by "/".
    def module
      modules.join('/')
    end

    def to_s
      @id.to_s
    end
  end
end
