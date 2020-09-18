class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include CurrentBasket
  before_action :set_basket

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:tile, :first_name, :last_name])
  end
end
