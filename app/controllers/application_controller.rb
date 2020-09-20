class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include CurrentBasket
  before_action :set_basket

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:tile, :first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    if current_user.admin == true
      rails_admin_path
    else
      root_path
    end
  end
end
