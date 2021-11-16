class Pokedex < ApplicationRecord
    # validates things 

    POKEMON_TYPES = %w(Normal Fire Water Grass Electric Ice Fighting Poison Ground Flying Psychic Bug Rock Ghost Dark Dragon Steel Fairy).freeze


end

# t.string "species", null: false
# t.string "type"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["species"], name: "index_pokedex_on_species"