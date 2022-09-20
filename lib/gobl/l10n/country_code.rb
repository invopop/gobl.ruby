# frozen_string_literal: true

##
## DO NOT EDIT - This file was generated automatically.
##
## Generated with GOBL v0.30.2
##


module GOBL
  module L10n
    class CountryCode < GOBL::Struct
      # The Schema ID of the GOBL CountryCode structure
      SCHEMA_ID = 'https://gobl.org/draft-0/l10n/country-code'

      # The enumeration of values of the object and their descriptions (Values different to these are not allowed)
      ENUM = {
        'AF' => 'Afghanistan',
        'AX' => 'Åland Islands',
        'AL' => 'Albania',
        'DZ' => 'Algeria',
        'AS' => 'American Samoa',
        'AD' => 'Andorra',
        'AO' => 'Angola',
        'AI' => 'Anguilla',
        'AQ' => 'Antarctica',
        'AG' => 'Antigua and Barbuda',
        'AR' => 'Argentina',
        'AM' => 'Armenia',
        'AW' => 'Aruba',
        'AU' => 'Australia ',
        'AT' => 'Austria',
        'AZ' => 'Azerbaijan',
        'BS' => 'Bahamas (the)',
        'BH' => 'Bahrain',
        'BD' => 'Bangladesh',
        'BB' => 'Barbados',
        'BY' => 'Belarus',
        'BE' => 'Belgium',
        'BZ' => 'Belize',
        'BJ' => 'Benin',
        'BM' => 'Bermuda',
        'BT' => 'Bhutan',
        'BO' => 'Bolivia (Plurinational State of)',
        'BQ' => 'Bonaire, Sint Eustatius and Saba',
        'BA' => 'Bosnia and Herzegovina',
        'BW' => 'Botswana',
        'BV' => 'Bouvet Island',
        'BR' => 'Brazil',
        'IO' => 'British Indian Ocean Territory (the)',
        'BN' => 'Brunei Darussalam',
        'BG' => 'Bulgaria',
        'BF' => 'Burkina Faso',
        'BI' => 'Burundi',
        'CV' => 'Cabo Verde',
        'KH' => 'Cambodia',
        'CM' => 'Cameroon',
        'CA' => 'Canada',
        'KY' => 'Cayman Islands (the)',
        'CF' => 'Central African Republic (the)',
        'TD' => 'Chad',
        'CL' => 'Chile',
        'CN' => 'China',
        'CX' => 'Christmas Island',
        'CC' => 'Cocos (Keeling) Islands (the)',
        'CO' => 'Colombia',
        'KM' => 'Comoros (the)',
        'CG' => 'Congo (the Democratic Republic of the)',
        'CD' => 'Congo (the)',
        'CK' => 'Cook Islands (the)',
        'CR' => 'Costa Rica',
        'CI' => 'Côte dIvoireIvoire',
        'HR' => 'Croatia',
        'CU' => 'Cuba',
        'CW' => 'Curaçao',
        'CY' => 'Cyprus',
        'CZ' => 'Czechia',
        'DK' => 'Denmark',
        'DJ' => 'Djibouti',
        'DM' => 'Dominica',
        'DO' => 'Dominican Republic (the)',
        'EC' => 'Ecuador',
        'EG' => 'Egypt',
        'SV' => 'El Salvador',
        'GQ' => 'Equatorial Guinea',
        'ER' => 'Eritrea',
        'EE' => 'Estonia',
        'SZ' => 'Eswatini',
        'ET' => 'Ethiopia',
        'FK' => 'Falkland Islands (the)',
        'FO' => 'Faroe Islands (the)',
        'FJ' => 'Fiji',
        'FI' => 'Finland',
        'FR' => 'France',
        'GF' => 'French Guiana',
        'PF' => 'French Polynesia',
        'TF' => 'French Southern Territories (the) ',
        'GA' => 'Gabon',
        'GM' => 'Gambia (the)',
        'GE' => 'Georgia',
        'DE' => 'Germany',
        'GH' => 'Ghana',
        'GI' => 'Gibraltar',
        'GR' => 'Greece',
        'GL' => 'Greenland',
        'GD' => 'Grenada',
        'GP' => 'Guadeloupe',
        'GU' => 'Guam',
        'GT' => 'Guatemala',
        'GG' => 'Guernsey',
        'GN' => 'Guinea',
        'GW' => 'Guinea-Bissau',
        'GY' => 'Guyana',
        'HT' => 'Haiti',
        'HM' => 'Heard Island and McDonald Islands',
        'VA' => 'Holy See (the)',
        'HN' => 'Honduras',
        'HK' => 'Hong Kong',
        'HU' => 'Hungary',
        'IS' => 'Iceland',
        'IN' => 'India',
        'ID' => 'Indonesia',
        'IR' => 'Iran (Islamic Republic of)',
        'IQ' => 'Iraq',
        'IE' => 'Ireland',
        'IM' => 'Isle of Man',
        'IL' => 'Israel',
        'IT' => 'Italy',
        'JM' => 'Jamaica',
        'JP' => 'Japan',
        'JE' => 'Jersey',
        'JO' => 'Jordan',
        'KZ' => 'Kazakhstan',
        'KE' => 'Kenya',
        'KI' => 'Kiribati',
        'KP' => 'Korea (the Democratic Peoples Republic of)s Republic of)',
        'KR' => 'Korea (the Republic of)',
        'KW' => 'Kuwait',
        'KG' => 'Kyrgyzstan',
        'LA' => 'Lao Peoples Democratic Republic (the)s Democratic Republic (the)',
        'LV' => 'Latvia',
        'LB' => 'Lebanon',
        'LS' => 'Lesotho',
        'LR' => 'Liberia',
        'LY' => 'Libya',
        'LI' => 'Liechtenstein',
        'LT' => 'Lithuania',
        'LU' => 'Luxembourg',
        'MO' => 'Macao',
        'MK' => 'North Macedonia',
        'MG' => 'Madagascar',
        'MW' => 'Malawi',
        'MY' => 'Malaysia',
        'MV' => 'Maldives',
        'ML' => 'Mali',
        'MT' => 'Malta',
        'MH' => 'Marshall Islands (the)',
        'MQ' => 'Martinique',
        'MR' => 'Mauritania',
        'MU' => 'Mauritius',
        'YT' => 'Mayotte',
        'MX' => 'Mexico',
        'FM' => 'Micronesia (Federated States of)',
        'MD' => 'Moldova (the Republic of)',
        'MC' => 'Monaco',
        'MN' => 'Mongolia',
        'ME' => 'Montenegro',
        'MS' => 'Montserrat',
        'MA' => 'Morocco',
        'MZ' => 'Mozambique',
        'MM' => 'Myanmar',
        'NA' => 'Namibia',
        'NR' => 'Nauru',
        'NP' => 'Nepal',
        'NL' => 'Netherlands (the)',
        'NC' => 'New Caledonia',
        'NZ' => 'New Zealand',
        'NI' => 'Nicaragua',
        'NE' => 'Niger (the)',
        'NG' => 'Nigeria',
        'NU' => 'Niue',
        'NF' => 'Norfolk Island',
        'MP' => 'Northern Mariana Islands (the)',
        'NO' => 'Norway',
        'OM' => 'Oman',
        'PK' => 'Pakistan',
        'PW' => 'Palau',
        'PS' => 'Palestine, State of',
        'PA' => 'Panama',
        'PG' => 'Papua New Guinea',
        'PY' => 'Paraguay',
        'PE' => 'Peru',
        'PH' => 'Philippines (the)',
        'PN' => 'Pitcairn',
        'PL' => 'Poland',
        'PT' => 'Portugal',
        'PR' => 'Puerto Rico',
        'QA' => 'Qatar',
        'RE' => 'Réunion',
        'RO' => 'Romania',
        'RU' => 'Russian Federation (the)',
        'RW' => 'Rwanda',
        'BL' => 'Saint Barthélemy',
        'SH' => 'Saint Helena, Ascension and Tristan da Cunha',
        'KN' => 'Saint Kitts and Nevis',
        'LC' => 'Saint Lucia',
        'MF' => 'Saint Martin (French part)',
        'PM' => 'Saint Pierre and Miquelon',
        'VC' => 'Saint Vincent and the Grenadines',
        'WS' => 'Samoa',
        'SM' => 'San Marino',
        'ST' => 'Sao Tome and Principe',
        'SA' => 'Saudi Arabia',
        'SN' => 'Senegal',
        'RS' => 'Serbia',
        'SC' => 'Seychelles',
        'SL' => 'Sierra Leone',
        'SG' => 'Singapore',
        'SX' => 'Sint Maarten (Dutch part)',
        'SK' => 'Slovakia',
        'SI' => 'Slovenia',
        'SB' => 'Solomon Islands',
        'SO' => 'Somalia',
        'ZA' => 'South Africa',
        'GS' => 'South Georgia and the South Sandwich Islands',
        'SS' => 'South Sudan',
        'ES' => 'Spain',
        'LK' => 'Sri Lanka',
        'SD' => 'Sudan (the)',
        'SR' => 'Suriname',
        'SJ' => 'Svalbard and Jan Mayen',
        'SE' => 'Sweden',
        'CH' => 'Switzerland',
        'SY' => 'Syrian Arab Republic (the)',
        'TW' => 'Taiwan (Province of China)',
        'TJ' => 'Tajikistan',
        'TZ' => 'Tanzania, the United Republic of',
        'TH' => 'Thailand',
        'TL' => 'Timor-Leste ',
        'TG' => 'Togo',
        'TK' => 'Tokelau',
        'TO' => 'Tonga',
        'TT' => 'Trinidad and Tobago',
        'TN' => 'Tunisia',
        'TR' => 'Türkiye',
        'TM' => 'Turkmenistan',
        'TC' => 'Turks and Caicos Islands (the)',
        'TV' => 'Tuvalu',
        'UG' => 'Uganda',
        'UA' => 'Ukraine',
        'AE' => 'United Arab Emirates (the)',
        'GB' => 'United Kingdom of Great Britain and Northern Ireland (the)',
        'US' => 'United States of America (the)',
        'UM' => 'United States Minor Outlying Islands (the)',
        'UY' => 'Uruguay',
        'UZ' => 'Uzbekistan',
        'VU' => 'Vanuatu',
        'VE' => 'Venezuela (Bolivarian Republic of)',
        'VN' => 'Viet Nam',
        'VG' => 'Virgin Islands (British)',
        'VI' => 'Virgin Islands (U.S.)',
        'WF' => 'Wallis and Futuna',
        'EH' => 'Western Sahara',
        'YE' => 'Yemen',
        'ZM' => 'Zambia',
        'ZW' => 'Zimbabwe'
      }

      attribute :_value, GOBL::Types::String.enum(*ENUM.keys)
      private :_value

      # Creates a new object from a GOBL value
      #
      # @param data [String] the GOBL value
      #
      # @return [CountryCode] the object created from the given data
      def self.from_gobl!(data)
        new(_value: data)
      end

      # Returns a GOBL value representing the current object
      #
      # @return [String] the GOBL value that represents the current object
      def to_gobl
        _value
      end

      # Returns a {CountryCode} that corresponds to a given object. The object can be a
      # `Symbol`, a `String` or anything coercible into one (via `#to_s`).
      #
      # @param object [Symbol, String, #to_s] the value of the object.
      #
      # @return [CountryCode] the object corresponding to the given value.
      #
      # @example Instantiating from a symbol
      #   country_code = GOBL::L10n::CountryCode.new(:af)
      #
      # @example Instantiating from a string
      #   country_code = GOBL::L10n::CountryCode.new('AF')
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
      # to {CountryCode} objects, the current object can be compared to a `Symbol`, a
      # `String` or anything coercible into one (via `#to_s`)
      #
      # @param other [CountryCode, Symbol, String, #to_s] the other object to compare to
      #
      # @return [Boolean] `true` if the objects are equivalent, `false` otherwise
      #
      # @example Comparing to another {CountryCode} object
      #   country_code = GOBL::L10n::CountryCode.new('AF')
      #   country_code == GOBL::L10n::CountryCode.new('AF') #=> true
      #   country_code == GOBL::L10n::CountryCode.new('AX') #=> false
      #
      # @example Comparing to a string
      #   country_code = GOBL::L10n::CountryCode.new('AF')
      #   country_code == 'AF' #=> true
      #   country_code == 'AX' #=> false
      #
      # @example Comparing to a symbol
      #   country_code = GOBL::L10n::CountryCode.new('AF')
      #   country_code == :af #=> true
      #   country_code == :ax #=> false
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
      # @return [Array<CountryCode>] the array of enumerated objects
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

      # Enables dynamic value inquirers like `CountryCode#af?` for
      # each of the declared enum values (see {ENUM}). Each inquirer returns a
      # `Boolean` denoting whether the value equals the enquired value (`true`) or
      # not (`false`)
      #
      # @example
      #   country_code = GOBL::L10n::CountryCode.new('AF')
      #   country_code.af? # => true
      #   country_code.ax? # => false
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

