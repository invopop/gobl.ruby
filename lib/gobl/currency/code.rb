# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##

require 'dry-struct'

module GOBL
  module Currency
    # ISO Currency Code
    class Code < Dry::Struct
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

      def self.from_gobl!(data)
        new(_value: data)
      end

      def self.from_json!(json)
        from_gobl!(JSON.parse(json))
      end

      def to_gobl
        _value
      end

      def to_json(options = nil)
        JSON.generate(to_gobl, options)
      end

      def to_s
        _value.to_s
      end

      def ==(other)
        case other
        when self.class
          super
        when String
          to_s == other
        when Symbol
          to_sym == other
        else
          if other.respond_to?(:to_s)
            self == other.to_s
          else
            super
          end
        end
      end

      def self.new(object)
        case object
        when Hash, self
          super
        when String
        super _value: object

        when Symbol
        super _value: lookup_enum_key_from_sym(object)

        else
          if object.respond_to?(:to_s)
        super _value: object.to_s
      else
        super
      end

        end
      end

      def to_sym
        self.class.enum_key_to_sym(to_s)
      end

      def self.lookup_enum_key_from_sym(sym)
        ENUM.keys.find { |key| enum_key_to_sym(key) == sym }
      end

      def self.enum_key_to_sym(object)
        object.underscore.to_sym
      end

      def description
        ENUM.fetch(_value, _value)
      end

      def respond_to_missing?(method_name, include_private = false)
        inquired_key(method_name).present? || super
      end

      def method_missing(method_name, *args, &block)
        if value = inquired_key(method_name)
          _value == value
        else
          super
        end
      end

      def inquired_key(method_name)
        method_name =~ /(.+)\?$/ && self.class.lookup_enum_key_from_sym($1.to_sym)
      end
    end
  end
end

