# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##


module GOBL
  module Currency
    # ISO Currency Code
    class Code < GOBL::Struct
      # The Schema ID of the GOBL Code structure
      SCHEMA_ID = 'https://gobl.org/draft-0/currency/code'

      # The enumeration of values of the object and their descriptions (Values different to these are not allowed)
      ENUM = {
        'AED' => 'UAE Dirham',
        'AFN' => 'Afghani',
        'ALL' => 'Lek',
        'AMD' => 'Armenian Dram',
        'ANG' => 'Netherlands Antillean Guilder',
        'AOA' => 'Kwanza',
        'ARS' => 'Argentine Peso',
        'AUD' => 'Australian Dollar',
        'AWG' => 'Aruban Florin',
        'AZN' => 'Azerbaijan Manat',
        'BAM' => 'Convertible Mark',
        'BBD' => 'Barbados Dollar',
        'BDT' => 'Taka',
        'BGN' => 'Bulgarian Lev',
        'BHD' => 'Bahraini Dinar',
        'BIF' => 'Burundi Franc',
        'BMD' => 'Bermudian Dollar',
        'BND' => 'Brunei Dollar',
        'BOB' => 'Boliviano',
        'BOV' => 'Mvdol',
        'BRL' => 'Brazilian Real',
        'BSD' => 'Bahamian Dollar',
        'BTN' => 'Ngultrum',
        'BWP' => 'Pula',
        'BYN' => 'Belarusian Ruble',
        'BZD' => 'Belize Dollar',
        'CAD' => 'Canadian Dollar',
        'CDF' => 'Congolese Franc',
        'CHE' => 'WIR Euro',
        'CHF' => 'Swiss Franc',
        'CHW' => 'WIR Franc',
        'CLF' => 'Unidad de Fomento',
        'CLP' => 'Chilean Peso',
        'CNY' => 'Yuan Renminbi',
        'COP' => 'Colombian Peso',
        'COU' => 'Unidad de Valor Real',
        'CRC' => 'Costa Rican Colon',
        'CUC' => 'Peso Convertible',
        'CUP' => 'Cuban Peso',
        'CVE' => 'Cabo Verde Escudo',
        'CZK' => 'Czech Koruna',
        'DJF' => 'Djibouti Franc',
        'DKK' => 'Danish Krone',
        'DOP' => 'Dominican Peso',
        'DZD' => 'Algerian Dinar',
        'EGP' => 'Egyptian Pound',
        'ERN' => 'Nakfa',
        'ETB' => 'Ethiopian Birr',
        'EUR' => 'Euro',
        'FJD' => 'Fiji Dollar',
        'FKP' => 'Falkland Islands Pound',
        'GBP' => 'Pound Sterling',
        'GEL' => 'Lari',
        'GHS' => 'Ghana Cedi',
        'GIP' => 'Gibraltar Pound',
        'GMD' => 'Dalasi',
        'GNF' => 'Guinean Franc',
        'GTQ' => 'Quetzal',
        'GYD' => 'Guyana Dollar',
        'HKD' => 'Hong Kong Dollar',
        'HNL' => 'Lempira',
        'HRK' => 'Kuna',
        'HTG' => 'Gourde',
        'HUF' => 'Forint',
        'IDR' => 'Rupiah',
        'ILS' => 'New Israeli Sheqel',
        'INR' => 'Indian Rupee',
        'IQD' => 'Iraqi Dinar',
        'IRR' => 'Iranian Rial',
        'ISK' => 'Iceland Krona',
        'JMD' => 'Jamaican Dollar',
        'JOD' => 'Jordanian Dinar',
        'JPY' => 'Yen',
        'KES' => 'Kenyan Shilling',
        'KGS' => 'Som',
        'KHR' => 'Riel',
        'KMF' => 'Comorian Franc ',
        'KPW' => 'North Korean Won',
        'KRW' => 'Won',
        'KWD' => 'Kuwaiti Dinar',
        'KYD' => 'Cayman Islands Dollar',
        'KZT' => 'Tenge',
        'LAK' => 'Lao Kip',
        'LBP' => 'Lebanese Pound',
        'LKR' => 'Sri Lanka Rupee',
        'LRD' => 'Liberian Dollar',
        'LSL' => 'Loti',
        'LYD' => 'Libyan Dinar',
        'MAD' => 'Moroccan Dirham',
        'MDL' => 'Moldovan Leu',
        'MGA' => 'Malagasy Ariary',
        'MKD' => 'Denar',
        'MMK' => 'Kyat',
        'MNT' => 'Tugrik',
        'MOP' => 'Pataca',
        'MRU' => 'Ouguiya',
        'MUR' => 'Mauritius Rupee',
        'MVR' => 'Rufiyaa',
        'MWK' => 'Malawi Kwacha',
        'MXN' => 'Mexican Peso',
        'MXV' => 'Mexican Unidad de Inversion (UDI)',
        'MYR' => 'Malaysian Ringgit',
        'MZN' => 'Mozambique Metical',
        'NAD' => 'Namibia Dollar',
        'NGN' => 'Naira',
        'NIO' => 'Cordoba Oro',
        'NOK' => 'Norwegian Krone',
        'NPR' => 'Nepalese Rupee',
        'NZD' => 'New Zealand Dollar',
        'OMR' => 'Rial Omani',
        'PAB' => 'Balboa',
        'PEN' => 'Sol',
        'PGK' => 'Kina',
        'PHP' => 'Philippine Peso',
        'PKR' => 'Pakistan Rupee',
        'PLN' => 'Zloty',
        'PYG' => 'Guarani',
        'QAR' => 'Qatari Rial',
        'RON' => 'Romanian Leu',
        'RSD' => 'Serbian Dinar',
        'RUB' => 'Russian Ruble',
        'RWF' => 'Rwanda Franc',
        'SAR' => 'Saudi Riyal',
        'SBD' => 'Solomon Islands Dollar',
        'SCR' => 'Seychelles Rupee',
        'SDG' => 'Sudanese Pound',
        'SEK' => 'Swedish Krona',
        'SGD' => 'Singapore Dollar',
        'SHP' => 'Saint Helena Pound',
        'SLL' => 'Leone',
        'SOS' => 'Somali Shilling',
        'SRD' => 'Surinam Dollar',
        'SSP' => 'South Sudanese Pound',
        'STN' => 'Dobra',
        'SVC' => 'El Salvador Colon',
        'SYP' => 'Syrian Pound',
        'SZL' => 'Lilangeni',
        'THB' => 'Baht',
        'TJS' => 'Somoni',
        'TMT' => 'Turkmenistan New Manat',
        'TND' => 'Tunisian Dinar',
        'TOP' => 'Pa’anga',
        'TRY' => 'Turkish Lira',
        'TTD' => 'Trinidad and Tobago Dollar',
        'TWD' => 'New Taiwan Dollar',
        'TZS' => 'Tanzanian Shilling',
        'UAH' => 'Hryvnia',
        'UGX' => 'Uganda Shilling',
        'USD' => 'US Dollar',
        'USN' => 'US Dollar (Next day)',
        'UYI' => 'Uruguay Peso en Unidades Indexadas (UI)',
        'UYU' => 'Peso Uruguayo',
        'UYW' => 'Unidad Previsional',
        'UZS' => 'Uzbekistan Sum',
        'VES' => 'Bolívar Soberano',
        'VND' => 'Dong',
        'VUV' => 'Vatu',
        'WST' => 'Tala',
        'XAF' => 'CFA Franc BEAC',
        'XCD' => 'East Caribbean Dollar',
        'XOF' => 'CFA Franc BCEAO',
        'XPF' => 'CFP Franc',
        'YER' => 'Yemeni Rial',
        'ZAR' => 'Rand',
        'ZMW' => 'Zambian Kwacha',
        'ZWL' => 'Zimbabwe Dollar'
      }

      attribute :_value, GOBL::Types::String.enum(*ENUM.keys)
      private :_value

      # Creates a new object from a GOBL value
      #
      # @param data [String] the GOBL value
      #
      # @return [Code] the object created from the given data
      def self.from_gobl!(data)
        new(_value: data)
      end

      # Returns a GOBL value representing the current object
      #
      # @return [String] the GOBL value that represents the current object
      def to_gobl
        _value
      end

      # Returns a {Code} that corresponds to a given object. The object can be a
      # `Symbol`, a `String` or anything coercible into one (via `#to_s`).
      #
      # @param object [Symbol, String, #to_s] the value of the object.
      #
      # @return [Code] the object corresponding to the given value.
      #
      # @example Instantiating from a symbol
      #   code = GOBL::Currency::Code.new(:aed)
      #
      # @example Instantiating from a string
      #   code = GOBL::Currency::Code.new('AED')
      def self.new(object)
        case object
        when Hash, self # internal use, not to be used in public calls
          super
        when Symbol
          new find_by_sym(object)
        else
          super _value: object.to_s
        end
      end

      # Returns the string representation of the current object
      #
      # @return [String] the string representation of the current object
      def to_s
        _value.to_s
      end

      # Returns the symbol representation of the current object
      #
      # @return [Symbol] the symbol representation of the current object
      def to_sym
        to_s.parameterize.underscore.to_sym
      end

      # Returns whether the current object is equivalent to a given one. In addition
      # to {Code} objects, the current object can be compared to a `Symbol`, a
      # `String` or anything coercible into one (via `#to_s`)
      #
      # @param other [Code, Symbol, String, #to_s] the other object to compare to
      #
      # @return [Boolean] `true` if the objects are equivalent, `false` otherwise
      #
      # @example Comparing to another {Code} object
      #   code = GOBL::Currency::Code.new('AED')
      #   code == GOBL::Currency::Code.new('AED') #=> true
      #   code == GOBL::Currency::Code.new('AFN') #=> false
      #
      # @example Comparing to a string
      #   code = GOBL::Currency::Code.new('AED')
      #   code == 'AED' #=> true
      #   code == 'AFN' #=> false
      #
      # @example Comparing to a symbol
      #   code = GOBL::Currency::Code.new('AED')
      #   code == :aed #=> true
      #   code == :afn #=> false
      def ==(other)
        case other
        when self.class
          super
        when Symbol
          to_sym == other
        else
          to_s == other.to_s
        end
      end

      # Returns an array with all the enumerated objects of this type
      #
      # @return [Array<Code>] the array of enumerated objects
      def self.all
        ENUM.keys.map { |key| new(key) }
      end

      # @api private
      def self.find_by_sym(sym)
        all.find { |object| object.to_sym == sym }
      end

      # @api private
      def self.find_by_inquirer(method_name)
        method_name =~ /(.+)\?$/ && find_by_sym($1.to_sym)
      end

      # Returns the description of the current object
      #
      # @return [String] the description of the current object
      def description
        ENUM.fetch(_value, _value)
      end

      # @api private
      def respond_to_missing?(method_name, include_private = false)
        self.class.find_by_inquirer(method_name) || super
      end

      # Enables dynamic value inquirers like `Code#aed?` for
      # each of the declared enum values (see {ENUM}). Each inquirer returns a
      # `Boolean` denoting whether the value equals the enquired value (`true`) or
      # not (`false`)
      #
      # @example
      #   code = GOBL::Currency::Code.new('AED')
      #   code.aed? # => true
      #   code.afn? # => false
      def method_missing(method_name, *args, &block)
        if value = self.class.find_by_inquirer(method_name)
          self == value
        else
          super
        end
      end
    end
  end
end

