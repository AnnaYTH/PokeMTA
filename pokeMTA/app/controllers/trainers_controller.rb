class TrainersController < ApplicationController
    before_action :require_logged_in, only: [:show, :index]
    
    def new 
        @trainer = Trainer.new
        render :new
    end

    def create 
        @trainer = Trainer.new(trainer_params)

        if @user.save
            login(@trainer)
            redirect_to trainers_url
        else 
            flash.now[:errors] = ["Password is too short (minimum is 6 characters)"]
            render :new
        end
    end

    def index 
        @trainers = Trainer.all 
        render :index
    end

    def show 
        @trainer = Trainer.find(params[:id])
        # redirect_to user_url(@user)
        render :show
    end

    private 
    def trainer_params
        params.require(:trainer).permit(:name, :password)
    end
end

# create_table "trainers", force: :cascade do |t|
#     t.string "name", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "session_token", null: false
#     t.string "password_digest", null: false
#     t.index ["name"], name: "index_trainers_on_name"
#   end