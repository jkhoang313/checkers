require 'pry'

class Board
  attr_reader :board, :player_one, :player_two, :game_over

  def initialize
    @board = Array.new(8){Array.new(8)}
    @player_one = Player.new("Black")
    @player_two = Player.new("White")

    add_pieces_to_board(player_one)
    add_pieces_to_board(player_two)

    draw_board
    run
  end

  def add_pieces_to_board(player)
    player.pieces.each {|piece| board[piece.hor][piece.vert] = piece}
  end

  def draw_board
    board.each.with_index(1) do |rows, row|
      print "#{row}|"
      rows.each.with_index(1) do |position, column|
        print position.nil? ? "__|" : "_#{get_icon(position.side)}|"
      end
      print "\n"
    end
    print "   1  2  3  4  5  6  7  8" + "\n"
  end

  def get_icon(side)
    if side == "Black"
      icon = "\u265F".encode('utf-8')
    elsif side == "White"
      icon = "\u2659".encode('utf-8')
    end
  end

  def run
    # until game_over?
      turn(player_one)
      turn(player_two)
    # end
  end

  def turn(turn_player)
    puts "#{turn_player.side} Player's turn"

    row = ask_for_input("row") - 1
    column = ask_for_input("column") - 1

    if check_valid_position?(row, column, turn_player.side)
      puts "Where do you want to move (right or left)?"
      direction = gets.strip
      move(direction, row, column, turn_player.side)
    end
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

  def check_valid_position?(row, column, side)
    position = board[row][column]
    !position.nil? && position.side == side
  end

  def move(direction, row, column, turn_player)
    piece = board[row][column]

    if turn_player == "Black"
      if direction == "right"
        board[row-1][column+1] = piece
      elsif direction == "left"
        board[row-1][column-1] = piece
      end
    elsif turn_player == "White"
      if direction == "right"
        board[row+1][column+1] = piece
      elsif direction == "left"
        board[row+1][column-1] = piece
      end
    end

    board[row][column] = nil
    draw_board
  end

  def game_over?
  end
end
