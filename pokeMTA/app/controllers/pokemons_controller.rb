class PokemonsController < ApplicationController

    def index 
        @pokemon = Pokemon.all
        render :index
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        render :show
    end

    def new
        @pokemon = Pokemon.new
        render :new
    end

    def create 
        @pokemon = Pokemon.new(pokemon_params)
        @pokemon.save 
        redirect_to pokemon_url(@pokemon)
    end

    def destroy #release into the wild, no pokemon were destroyed in the creation of this application 
    end

    def update 
        @pokemon = Pokemon.find(params[:id])
        @pokemon.update_attributes(pokemon_params)
        redirect_to pokemon_url(@pokemon)
    end

    private 

    def pokemon_params
        params.require(:pokemon).permit(:name, :pokedex_number, :trainer_id, :nature, :shiny, :gender)
    end
end