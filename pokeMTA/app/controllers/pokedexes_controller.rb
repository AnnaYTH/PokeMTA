class PokedexesController < ApplicationController

    def index 
        @pokemon = Pokedexes.all
        render :index
    end

    def show
        @pokemon = Pokedexes.find(params[:id])
        render :show
    end

    def new
        @pokemon = Pokedexes.new
        render :new
    end

    def create 
        @pokemon = Pokedexes.new(pokedex_params)
        @pokemon.save 
        redirect_to pokemon_url(@pokemon)
    end

    private 
    def pokedex_params
        params.require(:pokedex).permit(:species)
    end

end