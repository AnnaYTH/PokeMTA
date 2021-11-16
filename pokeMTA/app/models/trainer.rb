class Trainer < ApplicationRecord

    has_many :pokemon, 
        primary_key: :id, 
        foreign_key: :trainer_id, 
        class_name: :Pokemon

end