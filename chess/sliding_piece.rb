require_relative 'null_piece'
require 'byebug'

module SlidingPiece
  def moves
    move_list = []
    byebug
    self.move_dirs.each do |dir|
      move_list.concat(grow_unblocked_moves_in_dir(dir))
    end
    move_list
  end

  private

  def grow_unblocked_moves_in_dir(d_pos)
    current_pos = [pos[0] + d_pos[0], pos[1] + d_pos[1]]
    possible_destinations = []
    # until self.board[current_pos].is_a?(Piece)
    while board[current_pos].is_a?(NullPiece) &&
      current_pos.all? { |coordinate| coordinate.between?(0, 7) }
      current_pos = [current_pos[0] + d_pos[0], current_pos[1] + d_pos[1]]
      # current_pos[0] += d_pos[0]   # changes current_pos which is then shoveled into same place
      # current_pos[1] += d_pos[1]  # in the destinations array
    end
    possible_destinations << current_pos if self.board[current_pos].color != self.color

    return possible_destinations if self.board[current_pos].nil?
    possible_destinations
  end
end
