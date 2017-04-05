require_relative 'piece'
require_relative 'rook'
require_relative 'null_piece'
require 'singleton'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    make_starting_grid

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

  def in_bounds?(pos)
    row, col = pos
    row.between?(0,7) && col.between?(0,7)
  end

  def checkmate?

  end

  protected

  def make_starting_grid
    # 2.times do |row|
    #   8.times do |col|
    #     @grid[row][col] = Rook.new([row, col], :black, self)
    #   end
    # end
    populate

    (2..5).each do |row|
      8.times do |col|
        @grid[row][col] = NullPiece.instance
      end
    end

    # (6..7).each do |row|
    #   8.times do |col|
    #     @grid[row][col] = Rook.new([row, col], :white, self)
    #   end
    # end

  end

  def populate
    row = 0
    col = 0

    @grid[row][col] = Rook.new([row, col], :white, self)
    @grid[row][col + 7] = Rook.new([row, col + 7], :white, self)

    row = 7
    @grid[row][col] = Rook.new([row, col], :black, self)
    @grid[row][col + 7] = Rook.new([row, col + 7], :black, self)
  end

  def find_king(color)

  end



end
