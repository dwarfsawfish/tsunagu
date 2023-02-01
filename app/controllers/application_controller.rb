class ApplicationController < ActionController::Base
  before_action :user_permitted_parameters, if: :devise_controller?
  before_action :company_permitted_parameters, if: :devise_controller?

  private
  def user_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, 
      :first_name, :email, :encrypted_password])
  end

  def company_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :category_id, 
      :prefecture_id, :city, :house_number, :building, :last_name, :first_name])
  end
end