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

    POKEMON_NATURE = %w(Adament Bashful Bold Brave Calm Careful Docile Gentle Hardy Hasty Impish Jolly Lax Lonely Mild Modest Naive Naughty Quiet Quirky Rash Relaxed Sassy Serious Timid).freeze
    # validates things

    belongs_to :trainer, 
        primary_key: :id, 
        foreign_key: :trainer_id, 
        class_name: :Trainer

    def time_with_trainer
        time_ago_in_words(created_at)
    end

end
