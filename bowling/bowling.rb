class Game
# Its easier if you separate this into two classes, one for frame and one for the game
  def initialize
    Frame.clear
  end

  def roll(pins)
    raise BowlingError.new('Cannot score when the game is complete') if finished?
    raise BowlingError.new('This is not a valid number') if score_out_of_bounds?(pins)
    return Frame.new(pin_1: pins) if new_frame?
    raise BowlingError.new('Impossible score') if over_10?(pins)
    Frame.last.pin_2 = pins
  end

  def score
    score_errors
    Frame.total_score
  end

  private

  def self.not_started
    Frame.instances.empty?
  end

  def game_not_finished?
    Game.not_started || Frame.instances.size < 10
  end

  def strike_bonus_not_computed?
    Frame.last_shot_before_bonus.strike? && Frame.instances.size < 11
  end

  def double_strike_bonus_not_computed?
    Frame.last_shot_before_bonus.strike? && Frame.bonus && Frame.bonus.strike?
  end

  def spare_bonus_not_computed?
    Frame.last_shot_before_bonus.spare? && !Frame.bonus
  end

  def last_bonus_error
    raise BowlingError.new('Last bonus launches must already be calculated')
  end

  def score_errors
    raise BowlingError.new('Game must be finished') if game_not_finished?
    last_bonus_error if (strike_bonus_not_computed? || double_strike_bonus_not_computed? || spare_bonus_not_computed?)
  end

  def finished?
    Frame.instances.size == 10 && Frame.last.finished? && Frame.last.score < 10
  end

  def over_10?(pins)
    Frame.last.pin_1 + pins > 10
  end

  def new_frame?
    Game.not_started || Frame.last.finished?
  end

  def score_out_of_bounds?(pins)
    !((0..10).include?(pins))
  end

end

class Game::BowlingError < StandardError
  def initialize(msg='')
    super
  end
end

class Frame

  class << self
    attr_accessor :instances
  end
  @instances = []

  attr_accessor :pin_1, :pin_2
  def initialize(params)
    @pin_1 = params[:pin_1]
    @pin_2 = params[:pin_2]
    Frame.instances << self
  end

  def could_be_spare?
    pin_1 < 10 && !pin_2
  end

  def finished?
    (pin_1 == 10) || pin_2
  end

  def spare?
    pin_1 < 10 && (pin_1 + pin_2) == 10 if finished?
  end

  def strike?
    pin_1 == 10
  end

  def score
    return pin_1 + pin_2 if pin_2
    pin_1
  end

  def self.total_score
    @instances.map.with_index do |frame,pos|
      second_frame, third_frame = @instances[pos + 1], @instances[pos + 2]

      if !(frame.bonus?(pos))
        next 10 + second_frame.score + third_frame.pin_1 if frame.strike? && second_frame.strike?
        next 10 + second_frame.score if frame.strike? && !(second_frame.strike?)
        next frame.score + second_frame.pin_1 if frame.spare?
        frame.score

      else
        0 if frame.bonus?(pos)
      end
    end.sum
  end

  def bonus?(pos)
    pos >= 10
  end

  def self.clear
    @instances.clear
  end

  def self.last
    @instances.last
  end

  def self.bonus
    Frame.instances.last if Frame.instances.size == 11
  end

  def self.last_shot_before_bonus
    Frame.instances[9]
  end


end

module BookKeeping
  VERSION = 3
end