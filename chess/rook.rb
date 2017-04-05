require_relative 'piece'
require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  def to_s
    " R "
  end

  def move_dirs
    [
      [-1, 0],
      [1, 0],
      [0, -1],
      [0, 1]
    ]

  end
end
