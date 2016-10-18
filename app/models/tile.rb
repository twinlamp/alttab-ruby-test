class Tile < ApplicationRecord
  belongs_to :play

  def exists?
    raise 'Not Implemented'
  end

  def adjacent
    raise 'Not Implemented'
  end

  def center?
    x == 0 && y == 0
  end

  def inv(x_or_y)
    x_or_y == :x ? { y: y } : { x: x }
  end

  def overlaps_any?(tiles)
    tiles.any? { |m| m.x == x && m.y == y }
  end

  def any_adjacent?
    adjacent.count > 0
  end
end
