# frozen_string_literal: true

# RPMCalculator class description
class RPNCalculator
  def initialize
    @values = []
    @value = 0
  end
  attr_reader :value
  def value=(value)
    @value = value
  end

  def push(number)
    @values.push(number)
  end

  def plus
    if @values.empty?
      raise 'calculator is empty'
    elsif @values.size == 1
      @value += @values.first
    else
      @value += @values.pop + @values.pop
    end
    @value
  end

  def minus
    if @values.empty?
      raise 'calculator is empty'
    elsif @values.size == 1
      @value = @values.first + @value
    else
      @value = @values[@values.length - 2] - @values.last
      @values.delete_at(@values.length - 2)
      @values.delete_at(@values.length - 1)
    end
    @value
  end

  def divide
    if @values.empty?
      raise 'calculator is empty'
    elsif @values.size == 1
      @value = @values.first / @value
    else
      @value = @values[@values.length - 2] / @values.last.to_f
      @values.delete_at(@values.length - 2)
      @values.delete_at(@values.length - 1)
    end
    @value
  end

  def times
    if @values.empty?
      raise 'calculator is empty'
    elsif @values.size == 1
      @value = @values.first * @value
    else
      @value = @values[@values.length - 2] * @values.last.to_f
      @values.delete_at(@values.length - 2)
      @values.delete_at(@values.length - 1)
    end
    @value
  end

  def tokens(tokens_string)
    new_mass = []
    d = tokens_string.split(' ')
    operators = %w[+ - / *]
    d.map do |element|
    if operators.include?(element)
      new_mass.push(element.to_sym)
    else
      new_mass.push(element.to_i)
    end
    end
    new_mass
  end

  def evaluate

  end
end
