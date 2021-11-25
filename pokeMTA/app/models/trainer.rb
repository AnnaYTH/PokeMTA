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
    validates :name, presence:true
    validates :password_digest, presence:true 
    validates :password, length: {minimum:6}, allow_nil:true 
    after_initialize :ensure_session_token
    attr_reader :ensure_session_token
    
    has_many :pokemon, 
        primary_key: :id, 
        foreign_key: :trainer_id, 
        class_name: :Pokemon
    
    def self.find_by_credentials(username, password)
        trainer = Trainer.find_by(username:username)
        if trainer && trainer.is_password?(password)
            trainer
        else 
            nil 
        end
    end

    def is_password?(password)
        password_obj = BCrypt::Password.new(self.password_digest)
        password_obj.ispassword?
    end

    def generate_session_token
        SecureRandom::base64
    end

    def password=(password)
        self.password_digest = BCrpyt::Password.create(password)
        @password = password
    end

    def ensure_session_token
        self.session_token ||= generate_session_token
    end

    def reset_session_token
        self.session_token = generate_session_token
        self.save!
        self.session_token
    end

    private 
    def trainer_params
        params.require(:trainer).permit(:name, :password)
    end
end
