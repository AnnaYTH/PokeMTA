class Pokedexe < ApplicationRecord
    validates :species, :type, presence: true 

    POKEMON_TYPES = %w(Normal Fire Water Grass Electric Ice Fighting Poison Ground Flying Psychic Bug Rock Ghost Dark Dragon Steel Fairy).freeze

    validates :type, inclusion: {in: POKEMON_TYPES, message: "Not a valid pokemon type"}


end

# t.string "species", null: false
# t.string "type"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["species"], name: "index_pokedex_on_species"