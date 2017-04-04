
class Piece

  #include SlidingPiece

  def to_s
  end

  def empty?

  end

  def symbol

  end

  def valid_moves
    moves = []
    move_dirs
  end

  private

  def move_into_check(to_pos)
  end

end

module SlidingPiece
  def moves

  end

  private
  def move_dirs

  end

  def horizontal_dirs

  end

  def diagonal_dirs

  end

  def vertical_dirs

  end

  def grow_unblocked_moves_in_dir(dx, dy)

  end

end


module SteppingPiece

end
