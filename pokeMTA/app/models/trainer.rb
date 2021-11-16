# == Schema Information
#
# Table name: trainers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Trainer < ApplicationRecord
    # validates things
    
    has_many :pokemon, 
        primary_key: :id, 
        foreign_key: :trainer_id, 
        class_name: :Pokemon

end
