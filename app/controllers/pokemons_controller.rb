class PokemonsController < ApplicationController
	before_action :set_pokemon, only: [:show, :edit, :update]

	def index
		@pokemons = Pokemon.paginate(page: params[:page] , per_page: 2)
			.includes(:type)
	end

	def show
		@pokemon = Pokemon.find params[:id]
	end

	def new
			@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new pokemon_params
		if @pokemon.save
			flash[:success] = "Le Pokemon #{@pokemon.name} a bien été enregistré."
			redirect_to @pokemon
		else
			render 'new'
		end
	end

	def edit
		@pokemon = Pokemon.find params[:id]
	end

	def update
		if @pokemon.update pokemon_params
			redirect_to @pokemon
		else
			render 'edit'
		end
	end

	private

	def destroy
		@pokemon.destroy
		redirect_to pokemon_path
	end
	def set_pokemon
		@pokemon = Pokemon.find params[:id]
	end
	def pokemon_params
		params.require(:pokemon).permit(:name, :number, :level, :health_points, :avatar, :type_id, move_ids: [])
	end
end