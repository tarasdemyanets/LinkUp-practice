# frozen_string_literal: true

def reverser
  str = yield.split(' ')
  str.each_with_index { |word, index| str[index] = word.reverse }
  str.join(' ')
end

def adder(number = 1)
  yield + number
end

def repeater(repeat = 1)
  i = 0
   while i < repeat
     yield
     i += 1
   end
end
