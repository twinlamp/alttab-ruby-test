class Play < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_many :tiles, autosave: true

  def tile_at(x, y)
    self.tiles << Tile.new(x: x, y: y, play: self)
  end

  def tiles_at(coords)
    self.tiles = []
    coords.map { |a| self.tile_at(a[0], a[1]) }
  end
end
