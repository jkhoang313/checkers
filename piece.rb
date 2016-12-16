class Piece
  attr_accessor :hor, :vert, :side

  def initialize(hor, vert, side)
    @hor = hor
    @vert = vert
    @side = side
  end
end
