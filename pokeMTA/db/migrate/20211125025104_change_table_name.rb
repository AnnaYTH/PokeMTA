class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :pokedex, :pokedexes
  end
end
