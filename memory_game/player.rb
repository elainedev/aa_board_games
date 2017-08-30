require'byebug'
class HumanPlayer
  attr_accessor :previous_guess

  def initialize(size)
    @previous_guess = nil
    @current_guess = nil
  end

  def get_input

    prompt

    @current_guess = parse(STDIN.gets.chomp)
    if @current_guess == @previous_guess
      raise SameCardError.new
    elsif @current_guess.any? {|int| int > 3 || int < 0}
      raise OutOfRangeError.new
    end
    @current_guess
  rescue StandardError => e
    puts e.message
    retry
  ensure
    puts "Hiya! We ran ensure."
    sleep(5)
  end

  def prompt
    puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
    print "> "
  end

  def parse(string)
    string.split(",").map { |x| Integer(x) }
  rescue ArgumentError => e
    raise ArgumentError, "Invalid input: please enter integers separated by commas"
  end

  def receive_revealed_card(pos, value)
    # duck typing
  end

  def receive_match(pos1, pos2)
    puts "It's a match!"
  end
end  # ends HumanPlayer class


class SameCardError < StandardError
  def message
    "Can't flip the same card twice"
  end
end

class OutOfRangeError < StandardError
  def message
    "Input out of range"
  end
end
=begin
class ComputerPlayer
  attr_accessor :previous_guess, :board_size

  def initialize(size)
    @board_size = size
    @matched_cards = {}
    @known_cards = {}
    @previous_guess = nil
  end

  def receive_revealed_card(pos,value)
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards[pos1] = true
    @matched_cards[pos2] = true
  end

  def get_input

    if previous_guess
      second_guess
    else
      first_guess
    end
  end

  def unmatched_pos
    (pos, _) = @known_cards.find do |pos, val|
      @known_cards.any? do |pos2, val2|
        (pos != pos2 && val == val2) &&
          !(@matched_cards[pos] || @matched_cards[pos2])
      end
    end

    pos
  end

  def match_previous
    (pos, _) = @known_cards.find do |pos, val|
      pos != previous_guess && val == @known_cards[previous_guess] &&
        !@matched_cards[pos]
    end

    pos
  end

  def first_guess
    unmatched_pos || random_guess
  end

  def second_guess
    match_previous || random_guess
  end

  def random_guess
    guess = nil

    until guess && !@known_cards[guess]
      guess = [rand(board_size), rand(board_size)]
    end

    guess
  end
end
=end
