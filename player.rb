class Player
  attr_accessor :pieces, :side

  def initialize(side)
    @side = side
    if side == "White"
      @pieces = [Piece.new(0, 0, 1), Piece.new(0, 2, 1), Piece.new(0, 4, 1), Piece.new(0, 6, 1),
        Piece.new(1, 1, 1), Piece.new(1, 3, 1), Piece.new(1, 5, 1), Piece.new(1, 7, 1),
        Piece.new(2, 0, 1), Piece.new(2, 2, 1), Piece.new(2, 4, 1), Piece.new(2, 6, 1)]
    elsif side == "Black"
      @pieces = [Piece.new(7, 1, 2), Piece.new(7, 3, 2), Piece.new(7, 5, 2), Piece.new(7, 7, 2),
        Piece.new(6, 0, 2), Piece.new(6, 2, 2), Piece.new(6, 4, 2), Piece.new(6, 6, 2),
        Piece.new(5, 1, 2), Piece.new(5, 3, 2), Piece.new(5, 5, 2), Piece.new(5, 7, 2)]
    end
  end
end
