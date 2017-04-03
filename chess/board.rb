require_relative 'piece'

class Board

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    # make_starting_grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def dup

  end

  def move_piece(color, from_pos, to_pos)

  end

  def move_piece!(from_pos, to_pos)
    if self[from_pos].nil?
      raise "You cannot move vacuous air."
    elsif !self[to_pos].nil?  # modify later to see if piece can move there
      raise "Invalid move."
    end
    self[from_pos], self[to_pos] = self[to_pos], self[from_pos]
    # need to check above line and update pieces' positions
  end

  def checkmate?

  end

  protected

  def make_starting_grid
    2.times do |row|
      8.times do |col|
        @grid[row][col] = Piece.new
      end
    end

    (6..7).each do |row|
      8.times do |col|
        @grid[row][col] = Piece.new
      end
    end

  end

  def find_king(color)

  end

end
