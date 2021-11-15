class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :name, null:false

      t.timestamps
    end
    add_index :trainers, :name

    create_table :pokemons do |t|
      t.string :name, null:false
      t.integer :pokedex_number, null:false 
      t.integer :trainer_id, null:false 
      t.string :nature, null:false 
      t.string :shiny
      t.string :gender

      t.timestamps
    end

    create_table :pokedex do |t|
      t.string :species, null:false 
      t.string :type, null:false 

      t.timestamps
    end

    add_index :pokedex, :species
  end
end
