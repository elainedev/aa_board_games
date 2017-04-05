require_relative 'null_piece'
require 'byebug'

module SteppingPiece

  def moves
    possible_destinations = []

    move_list = move_diffs.each do |step|

      current_pos = [pos.first + step.first, pos.last + step.last]
      unless board[current_pos].color == color
        possible_destinations << current_pos
      end
    end

    possible_destinations.reject! { |position| position.first < 0 || position.first > 7}
    possible_destinations.reject! { |position| position.last < 0 || position.last > 7}
    possible_destinations
  end
end
