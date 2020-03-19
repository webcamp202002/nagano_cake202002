class ApplicationController < ActionController::Base

  before_action :configure_sign_up_params, if: :devise_controller?
  private

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

  def after_sign_out_path_for(resource)
    case resource
    when Member
      new_customer_session_path
    when Admin
    new_admin_session_path
    end
  end

  def current_member?(menber)
    if current_member.nil?
      return false
    else
      member.id.equal?(current_member.id)
  end
end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode, :address, :phone_number])
  end
end