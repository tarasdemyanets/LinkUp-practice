# frozen_string_literal: true

# Temperature class description
class Temperature
  def initialize(f: 0.0, c: 0.0)
    @farenheit = f
    @celsius = c
  end
  def self.from_celsius(temperature)
    Temperature.new(:c => temperature)
  end
  def self.from_fahrenheit(temperature)
    Temperature.new(:f => temperature)
  end
  def ftoc
    ((@farenheit - 32) / 1.8).round
  end
  def ctof
    (@celsius * 1.8) + 32
  end
  def in_fahrenheit
    if @farenheit.zero?
      (@celsius * 1.8) + 32
    else
      @farenheit
    end
  end
  def in_celsius
    if @celsius.zero?
      (@farenheit - 32) / 1.8
    else
      @celsius
    end
  end
end

# Subclass of Temperature class
class Fahrenheit < Temperature
  def initialize(temperature)
    @temperature = temperature
  end
  def in_fahrenheit
    @temperature
  end
  def in_celsius
    (@temperature - 32) / 1.8
  end
end

# Subclass of Temperature class
class Celsius < Temperature
  def initialize(temperature)
    @temperature = temperature
  end
  def in_celsius
    @temperature
  end
  def in_fahrenheit
    (@temperature * 1.8) + 32
  end
end
