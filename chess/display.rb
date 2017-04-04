require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    board.grid.each_with_index do |row, i|
      row.each_with_index do |square, j|
        square_str = ""
        square_color = (i + j) % 2 == 0 ? :white : :light_blue
        unless square.nil?
          square_str = " P ".colorize(:color => :black, :background => square_color)
        else
          square_str = "   ".colorize(:color => :black, :background => square_color)
        end
        if [i, j] == @cursor.cursor_pos
          print square_str.colorize(:color => :black, :background => :yellow)
        else
          print square_str
        end
      end
      puts
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  while true
    display.render
    display.cursor.get_input
    system("clear")
  end
end
