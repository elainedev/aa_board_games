class Piece

  def initialize(start_pos, color, board)
    @pos = start_pos
    @color = color
    @board = board
  end

  attr_reader :pos, :color, :board


  def to_s
    # "Position: [#{pos[0]}, #{pos[1]}], Color: #{color}"
    self.symbol.to_s
  end

  def empty?

  end

  def moves
    # moves = []
    # move_dirs
  end

  private

  def move_into_check(to_pos)
  end

end






# def move_dirs
#
# end
#
# def horizontal_dirs
#
# end
#
# def diagonal_dirs
#
# end
#
# def vertical_dirs
#
# end
