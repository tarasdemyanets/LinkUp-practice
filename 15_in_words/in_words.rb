# frozen_string_literal: true

# The FixNum reopening
class Fixnum

  def key_words
    @key_words
  end
  def check_tens(key_words, number)
    if (number % 10).positive?
      if number > 10
        %(#{key_words[number - (number % 10)]} #{key_words[number % 10]})
      else
        %(#{key_words[number]})
      end
    else
      %(#{key_words[number - (number % 10)]})
    end
  end

  def check_hundreds(key_words, number)
    result = ''
    if number.zero?
      result = ''
    else
      if number > 100
      result += "#{key_words[number / 100]} hundred " + check_tens(key_words, number%100)
      else
        if number > 0 && number < 100
        result += check_tens(key_words, number)
        else
        result += ' '
        end
      end
    end
    result
  end
  def check_thousands(key_words, number)
    result = ''
      if number.zero?
        result = ''
      else
      result += check_hundreds(key_words, number) + ' thousand '
      end
    result
  end
  def check_millions(key_words, number)
    result = ''
      if number.zero?
        result += ''
      else
      result += check_hundreds(key_words, number) + ' million '
      end
    result
  end
  def check_billions(key_words, number)
    result = ''
      if number.zero?
        result += ''
      else
        result += check_hundreds(key_words, number) + ' billion '
      end
    result
  end
  def in_words
    key_words = {
      1_000_000_000 => 'billion',
      1_000_000 => 'million',
      1000 => 'thousand',
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
      1 => 'one',
      0 => 'zero'
    }
    result = ''
    if self <= 20
      key_words[self]
    elsif self > 20 && self < 100
      check_tens(key_words, self)
    elsif self >= 100 && self < 1000
      if (self % 100).zero?
        %(#{key_words[self/100]} hundred)
      else
        if key_words.include?(self % 100)
        %(#{key_words[self/100]} hundred #{key_words[self% 100]})
        else
        %(#{key_words[self/100]} hundred ) + check_tens(key_words, (self % 100))
        end
      end
    elsif self >= 1000 && self < 1_000_000
      if (self % 1000).zero?
        %(#{key_words[self / 1000]} thousand)
      else
        if key_words.include?(self % 1000)
        %(#{key_words[self / 1000]} thousand #{key_words[self%1000]})
        else
          hundreds = self % 1000
          tens = hundreds % 100
        check_thousands(key_words, (self / 1000)) + check_hundreds(key_words, hundreds/100) + ' hundred ' + check_tens(key_words, tens)
        end
      end
    elsif self >= 1_000_000 && self < 1_000_000_000
      if (self % 1_000_000).zero?
        %(#{key_words[self / 1_000_000]} million)
      else
        thousands = self % 1_000_000
        hundreds = thousands % 1000
        tens = hundreds % 100
        check_millions(key_words, (self / 1_000_000)) + check_thousands(key_words, thousands/1000) + check_hundreds(key_words, hundreds/100) + check_tens(key_words, tens)
      end
    elsif self >= 1_000_000_000 && self < 1_000_000_000_000
      if (self % 1_00_000_000).zero?
        %(#{key_words[self / 1_000_000]} billion)
      end
      millions = self % 1_000_000_000
      thousands = millions % 1_000_000
      hundreds = thousands % 1_000
      tens = hundreds % 100
      check_tens(key_words, (self / 1_000_000_000)) + %( billion ) + check_millions(key_words, millions/1_000_000) + check_thousands(key_words, thousands/1000) + check_hundreds(key_words, hundreds/100) + %( hundred ) + check_tens(key_words, tens)
    elsif self >= 1_000_000_000_000
      if (self % 1_000_000_000_000).zero?
        %(#{key_words[self / 1_000_000_000_000]} trillion)
      else
        if (self / 1_000_000_000_000) > 100
        check_hundreds(key_words, (self / 1_000_000_000_000))
        else
          billions = self % 1_000_000_000_000
          millions = billions % 1_000_000_000
          thousands = millions % 1_000_000
          hundreds = thousands % 1_000
          tens = hundreds % 100
          check_tens(key_words, (self / 1_000_000_000_000)) + %( trillion ) + check_billions(key_words, (billions)/1_000_000_000) + check_millions(key_words, millions/1_000_000) + check_thousands(key_words, thousands/1000) + check_hundreds(key_words, hundreds/100) + check_tens(key_words, tens)
        end
      end
    end
  end
end
