require 'pry'

class Board
  attr_reader :board, :players, :game_over

  def initialize
    @board = Array.new(8){Array.new(8)}
    @players = [Player.new("Black"), Player.new("White")]

    @players[0].pieces.each do |piece|
      @board[piece.hor][piece.vert] = "Black"
    end

    @players[1].pieces.each do |piece|
      @board[piece.hor][piece.vert] = "White"
    end
    draw_board
    run
  end

  def draw_board
    @board.each_with_index do |rows, row|
      print "#{row+1}|"
      rows.each_with_index do |position, column|
        if @board[row][column] == nil
          print "__|"
        else
          if @board[row][column] == "Black"
            icon = "\u265F".encode('utf-8')
          elsif @board[row][column] == "White"
            icon = "\u2659".encode('utf-8')
          end
          print "_#{icon}|"
        end
      end
      print "\n"
    end
    print "   1  2  3  4  5  6  7  8" + "\n"
  end

  def run
    # until @game_over
      turn(@players[0])
      turn(@players[1])
    # end
  end

  def turn(turn_player)
    puts "#{turn_player.side} Player's turn"

    row = ask_for_input("row") - 1
    column = ask_for_input("column") - 1

    position = @board[row][column]

    if !position.empty? && position == turn_player.side
      puts "Where do you want to move (right or left)?"
      direction = gets.strip
      move(direction, row, column, turn_player.side)
    end
  end

  def move(direction, row, column, turn_player)
    old_position = @board[row][column]

    if turn_player == "Black"
      if direction == "right"
        @board[row-1][column+1] = old_position
      elsif direction == "left"
        @board[row-1][column-1] = old_position
      end
    elsif turn_player == "White"
      if direction == "right"
        @board[row+1][column+1] = old_position
      elsif direction == "left"
        @board[row+1][column-1] = old_position
      end
    end

    @board[row][column] = nil
    draw_board
  end

  def ask_for_input(position)
    puts "Enter the #{position} of the piece you want to move."
    input = gets.strip.to_i
    until input.between?(1, 8)
      puts "Please enter a valid input"
      input = gets.strip.to_i
    end
    input
  end

end
