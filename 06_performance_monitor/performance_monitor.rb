# frozen_string_literal: true

require 'time'

def measure(number_of_times = 0)
  start_time = Time.now
  if number_of_times.zero?
    yield
  else
    number_of_times.times { |current| yield(current) }
  end
  (Time.now - start_time) / (number_of_times.zero? ? 1 : number_of_times)
end
