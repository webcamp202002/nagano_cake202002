class ApplicationController < ActionController::Base

  before_action :configure_sign_up_params, if: :devise_controller?
  
  def after_sign_up_path_for(resource)
  	case resource
  	when Member
  		root_path
  	end
  end

  def after_sign_in_path_for(resource)
  	case resource
  	when Admin
  		admins_homes_top_path
  	when Member
  		members_products_path
  	end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode, :address, :phone_number])
  end
end