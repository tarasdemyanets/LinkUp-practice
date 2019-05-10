# frozen_string_literal: true

# The FixNum reopening
class Fixnum

  DIVIDERS = {
    1_000_000_000_000 => 'trillion',
    1_000_000_000 => 'billion',
    1_000_000 => 'million',
    1000 => 'thousand',
    1 => ''
  }

  KEY_WORDS = {
    100 => 'hundred',
    90 => 'ninety',
    80 => 'eighty',
    70 => 'seventy',
    60 => 'sixty',
    50 => 'fifty',
    40 => 'forty',
    30 => 'thirty',
    20 => 'twenty',
    19 => 'nineteen',
    18 => 'eighteen',
    17 => 'seventeen',
    16 => 'sixteen',
    15 => 'fifteen',
    14 => 'fourteen',
    13 => 'thirteen',
    12 => 'twelve',
    11 => 'eleven',
    10 => 'ten',
    9 => 'nine',
    8 => 'eight',
    7 => 'seven',
    6 => 'six',
    5 => 'five',
    4 => 'four',
    3 => 'three',
    2 => 'two',
    1 => 'one'
  }.freeze

  def in_words
    user_func(self)
  end

  private

  def user_func(num)
    return 'zero' if num.zero?

    DIVIDERS.keys.each do |divider|
      return recursive_func(num, divider).rstrip if num >= divider
    end
  end

  def recursive_func(num, divider, result = '')
    current_num = num / divider

    if current_num.positive?
      result += check_hundreds(current_num) + " #{DIVIDERS[divider]} "
    end

    return result if divider < 1000

    recursive_func(num % divider, divider / 1000, result)
  end

  def check_tens(number)
    if (number % 10).positive?
      if number > 20
        %(#{KEY_WORDS[number - (number % 10)]} #{KEY_WORDS[number % 10]})
      else
        %(#{KEY_WORDS[number]})
      end
    else
      %(#{KEY_WORDS[number - (number % 10)]})
    end
  end

  def check_hundreds(number)
    if number >= 100
      "#{KEY_WORDS[number / 100]} hundred " + check_tens(number % 100)
    else
      check_tens(number)
    end
  end
end
