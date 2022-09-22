require 'uri'

module GOBL
  # Provide a wrapper around Schema IDs (URLs) so that it's easy to extract the type of
  # document we're dealing with
  class ID
    # Initializes a new {GOBL::ID} from a string URI
    #
    # @return [GOBL::ID]
    def initialize(val)
      @id = URI.parse(val)
    end

    # Returns whether the current schema ID represents a GOBL struct or not
    #
    # @return [Boolean] `true` if the current Schema ID represents a GOBL struct, `false`
    #   otherwise
    def gobl?
      @id.host == 'gobl.org'
    end

    # Returns the fragment part of the URI, without the '#'. This is usually used with
    # schema references
    #
    # @return [String] the fragment part of the schema URI
    def fragment
      @id.fragment
    end

    # Returns the GOBL schema version
    #
    # @return [String] the schema version
    def version
      @id.path.split('/')[1]
    end

    # Returns the name of the schema (by convention, the last element of a path)
    #
    # @return [String] the name of the schema
    def name
      @id.path.split('/').last
    end

    # Returns the module components of the path, which may be empty. The
    # last element of the path is always considered the name of the current schema,
    # and not the module
    #
    # @return [Array<String>] the module components of the schema
    def modules
      @id.path.split('/')[2..-2]
    end

    # Returns the module components of the path as a single string.
    #
    # @return [String] the module components string
    def module
      modules.join('/')
    end

    # Converts the schema into a `String`
    #
    # @return [String] the schema as a string
    def to_s
      @id.to_s
    end

    # Returns whether the current schema is equivalent to a given object. Any object that
    # can be coerced into a string via `#to_s` can be provided.
    #
    # @param other [#to_s] another object to compare the current one with
    #
    # @return [Boolean] `true` if the given other can be considered equivalent to the
    #   current schema, `false` otherwise
    def ==(other)
      to_s == other.to_s
    end
  end
end
