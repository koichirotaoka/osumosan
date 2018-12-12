class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller? #devise用の追加したカラムにストロングパラメーターを設定する為

  protected
  
  
  #devise用ストロングパラメータ設定
  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up)do |user_params|
        user_params.permit(:name, :email, :password,
                                 :password_confirmation)
      end
    elsif resource_class == Vendor
      devise_parameter_sanitizer.permit(:sign_up)do |vendor_params|
        vendor_params.permit(:name, :email, :password,
                                 :password_confirmation)
      end
    end
  end

end

