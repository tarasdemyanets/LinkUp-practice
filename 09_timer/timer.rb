# frozen_string_literal: true

# The Description of class Timer
class Timer
  def initialize(hours = 0.0, minutes = 0.0, seconds = 0.0)
    @hours = hours
    @minutes = minutes
    @seconds = seconds
  end

  def seconds
    @seconds
  end
  def seconds=(seconds)
    @seconds = seconds
  end
  def time_string
    @hours = (@seconds / 3600).floor
    @minutes = (@seconds % 3600 / 60).floor
    @seconds = (@seconds % 60 % 3600).floor
    format_time(@hours) + ':' + format_time(@minutes) + ':' + format_time(@seconds)
  end
  def format_time(some_time)
    time = String.new
    if some_time.zero?
      time + '00'
    elsif some_time < 10 && some_time.positive?
      time + '0' + some_time.to_s
    else
      time + some_time.to_s
    end
  end
end
