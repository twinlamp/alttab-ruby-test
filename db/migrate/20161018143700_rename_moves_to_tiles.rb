class RenameMovesToTiles < ActiveRecord::Migration[5.0]
  def change
    rename_table :moves, :tiles
  end
end
