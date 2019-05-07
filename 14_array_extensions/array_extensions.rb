# frozen_string_literal: true

# The Array class reopening
class Array
  # def initialize
  #   @array = []
  # end
  # attr_reader :array
  def sum
    # array_sum = 0
    # self.each { |element| array_sum += element }
    self.reduce(0, :+)
    # self.reduce(0) { |element, memo| memo + element }  <- НЕ ПРАВИЛЬНО (але працює, бо від перестановки доднків сума не міняється)
    self.reduce(0) { |memo, element| memo + element }
    # array_sum
  end

  def square
    self.map { |element| element * element }
  end

  def square!
    self.map! { |element| element * element }
  end
  def size
    length
  end
end
