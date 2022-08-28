class Triangle
  # write code here

  attr_accessor :length_one, :length_two, :length_three

  def initialize(length_one, length_two, length_three)
    @length_one = length_one
    @length_two = length_two
    @length_three = length_three
  end

  def kind
    if is_triangle?
      triangle_sides = [length_one, length_two, length_three]
      if triangle_sides.uniq.size == 1
        :equilateral
      elsif triangle_sides.uniq.size == 2
        :isosceles
      else
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

  private

  def is_triangle?
    sort_sides = [length_one, length_two, length_three].sort
    longest_side = sort_sides.pop
    longest_side < sort_sides.sum
  end
end