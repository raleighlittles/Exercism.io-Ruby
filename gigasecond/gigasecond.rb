module Gigasecond

  def self.from(start_time)
    # If we were using Rails, we could use the ActiveSupport module and do 10**9.seconds, but alas, we're not in Rails
    # Instead, use the fact that the "+" method on Time instances automatically adds by seconds
    end_time = start_time + 10**9
    return end_time
  end

end

module BookKeeping
  VERSION = 6
end