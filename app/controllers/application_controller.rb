class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_minimum

  before_filter :configure_permitted_parameters,
	if :devise_controller ?
	protected

	def configure_permitted_parameters
		devise_parameters_sanitizer.for(:sign_up) << :username
		devise_parameters_sanitizer.for(:account_update) << :username
	end

  private

  def check_minimum
  	total_count ) Pokemon.total_count
	mininum = 3
	flash[:warning] = "Attention vous avez moins de 
						#{mininum} Pokemons dans votre Pokedex
						(actuellement #{total_count})
						!" if total_count < mininum
	end
end


