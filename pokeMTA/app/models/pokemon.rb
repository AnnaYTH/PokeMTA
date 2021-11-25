# == Schema Information
#
# Table name: pokemons
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  pokedex_number :integer          not null
#  trainer_id     :integer          not null
#  nature         :string           not null
#  shiny          :string
#  gender         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'action_view'

class Pokemon < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :name, :pokedex_number, :trainer_id, :nature, presence:true 

    POKEMON_NATURE = %w(Adament Bashful Bold Brave Calm Careful Docile Gentle Hardy Hasty Impish Jolly Lax Lonely Mild Modest Naive Naughty Quiet Quirky Rash Relaxed Sassy Serious Timid).freeze

    validates :nature, inclusion: {in: POKEMON_NATURE, message: "Not a valid pokemon nature"}
    # validates :gender, inclusion: {in: %w(F M N/A)}

    belongs_to :trainer, 
        primary_key: :id, 
        foreign_key: :trainer_id, 
        class_name: :Trainer

    # has_one :species, 
    #     primary_key: :pokedex_number, 
    #     foreign_key: :id, 
    #     class_name: :Pokedex

    # has_many :types, #not sure about this one, please check me
    #     through: :species, 
    #     source: :type

    def time_with_trainer
        time_ago_in_words(created_at)
    end

end
