class Play < ApplicationRecord
  belongs_to :game
  belongs_to :user

  has_many :tiles, autosave: true

  validate :no_same_tiles
  validate :unbroken_line
  validate :touches_existing_tile,
           unless: proc { |p| p.tiles.select(&:center?).any? }
  validates_associated :tiles

  def tile_at(x, y)
    self.tiles << Tile.new(x: x, y: y, play: self)
  end

  def tiles_at(coords)
    self.tiles = []
    coords.map { |a| self.tile_at(a[0], a[1]) }
  end

  def common(x_or_y)
    tiles.map(&x_or_y).first if tiles.map(&x_or_y).uniq.size == 1
  end

  def range_values(x_or_y)
    (tiles.map(&x_or_y).min..tiles.map(&x_or_y).max).to_a
  end

  def unbroken_line
    { x: :y, y: :x }.each do |axis, orth|
      orth_coords = (tiles + Tile.by_game(game_id).where(axis => common(axis)))
                    .map(&orth)
      return true if common(axis) && (range_values(orth) - orth_coords).empty?
    end
    errors.add(:base, :unbroken_line)
  end

  def touches_existing_tile
    return if tiles.select(&:any_adjacent?).any?
    errors.add(:base, :touches_existing_tile)
  end

  def no_same_tiles
    return if tiles.map { |t| [t.x, t.y] }.uniq.length == tiles.length
    errors.add(:base, :same_tiles)
  end
end
