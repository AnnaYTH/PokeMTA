class AddColumnstoTrainers < ActiveRecord::Migration[5.2]
  def change
    add_column :trainers, :session_token, :string, null:false 
    add_column :trainers, :password_digest, :string, null:false
  end
end
