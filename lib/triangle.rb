require 'pry'
class Triangle

  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    # self.valid? # why not raise the error here so invalid triangles aren't created?
  end

  def kind
    self.valid?
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end

  def valid?
    not_neg = (side1 > 0 && side2 > 0 && side3 > 0)
    tri_equality = (side1 + side2) > side3 && (side2 + side3) > side1 && (side1 + side3) > side2
    if not_neg && tri_equality
      true
    else
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    end
  end



  class TriangleError < StandardError
    # def message
    #   "Not a valid triangle."
    # end
  end

end
