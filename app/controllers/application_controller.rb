class ApplicationController < ActionController::Base

  before_action :configure_sign_up_params, if: :devise_controller?
  protect_from_forgery with: :exception
  helper_method :current_cart

  def check_guest
    email = resource&.email || params[:member][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end

  private
  def current_cart

    if session[:cart_product_id]
      @cart = CartProduct.find(session[:car_product_id])
    else
      @cart = CartProduct.create
      session[:cart_product_id] = @cart_product.id
    end
  end

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