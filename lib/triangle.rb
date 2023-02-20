class Triangle
  attr_accessor :equilateral, :isosceles, :scalene
  
  def initialize(equilateral, isosceles, scalene)
    @equilateral = equilateral
    @isosceles   = isosceles
    @scalene     = scalene
  end
  # kind
  # if else: sideA==sideB && sideB == sideC return :equilateral
  # elsif: sideA == sideB || sideA == sideC || sideA || sideB == sideC return :isosceles
  # else return :scalene
  def kind
  validate_triangle
  if (equilateral == isosceles && isosceles == scalene)
    :equilateral
  elsif (equilateral == isosceles || isosceles == scalene || equilateral == scalene)
    :isosceles
  else
    :scalene
  end

end

  def validate_triangle
    sides = [equilateral, isosceles, scalene].sort
    raise TriangleError unless sides.all?(&:positive?)
    raise TriangleError unless sides[0] + sides[1] > sides[2]
    end

  class TriangleError < StandardError
    # triangle error code
  end

end