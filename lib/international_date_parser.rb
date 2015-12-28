  # -*- coding: utf-8 -*-
  #
  # Purpose:
  # Extend the date parsing capabilities of Ruby to work with dates with international month names.
  #
  # Usage:
  #
  # Date.parse_international(date_string)
  # DateTime.parse_international(date_string)
  # date_string.to_international_date
  #
  # Notes:
  # 1) This routine works by substituting your local month names (as defined by Date::MONTHNAMES) for the
  #    international names when they occur in the date_string.
  # 2) As distributed, this code works for French, German, Italian, and Spanish.  You must add the month
  #    names for any additional languages you wish to handle.
  #

module InternationalDateParser

  require 'international_date_parser/railtie' if defined?(Rails)

  class Date
    def self.parse_international(date)
      parse(date_to_english(date))
    end

    MONTH_TRANSLATIONS = []
    MONTH_TRANSLATIONS += %w(janvier février mars avril mai juin juillet août septembre octobre novembre décembre) # French
    MONTH_TRANSLATIONS += %w(Januar Februar März April Mai Juni Juli August September Oktober November Dezember)  # German
    MONTH_TRANSLATIONS += %w(gennaio febbraio marzo aprile maggio giugno luglio agosto settembre ottobre novembre dicembre)  # Italian
    MONTH_TRANSLATIONS += %w(enero  febrero marzo abril mayo  junio julio agosto  septiembre  octubre noviembre diciembre) # Spanish
    MONTH_TRANSLATIONS += %w(janeiro fevereiro março abril maio junho julho agosto setembro outubro novembro dezembro) # Portuguese

    MONTH_TRANSLATIONS_SHORT = MONTH_TRANSLATIONS.map{|m| m[0,3]}

    def self.date_to_english(date)
      month_from = date[/[^\s\d,]{3,}/i]      # Search for a month name
      month_number =(MONTH_TRANSLATIONS.index(month_from) || MONTH_TRANSLATIONS_SHORT.index(month_from))
      date.sub(month_from, Date::MONTHNAMES[month_number % 12 + 1]) if month_number
    end
  end

  class DateTime
    def self.parse_international(string)
      parse Date.date_to_english(string)
    end
  end

  class String
    def to_international_date
      Date::parse_international(self).to_date
    end
  end

end