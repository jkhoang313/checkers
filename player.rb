class Player
  attr_accessor :pieces, :side

  def initialize(side)
    @side = side
    if side == "White"
      @pieces = [
        Piece.new(0, 0, "White"), Piece.new(0, 2, "White"), Piece.new(0, 4, "White"), Piece.new(0, 6, "White"),
        Piece.new(1, 1, "White"), Piece.new(1, 3, "White"), Piece.new(1, 5, "White"), Piece.new(1, 7, "White"),
        Piece.new(2, 0, "White"), Piece.new(2, 2, "White"), Piece.new(2, 4, "White"), Piece.new(2, 6, "White")
      ]
    elsif side == "Black"
      @pieces = [
        Piece.new(7, 1, "Black"), Piece.new(7, 3, "Black"), Piece.new(7, 5, "Black"), Piece.new(7, 7, "Black"),
        Piece.new(6, 0, "Black"), Piece.new(6, 2, "Black"), Piece.new(6, 4, "Black"), Piece.new(6, 6, "Black"),
        Piece.new(5, 1, "Black"), Piece.new(5, 3, "Black"), Piece.new(5, 5, "Black"), Piece.new(5, 7, "Black")
      ]
    end
  end
end
