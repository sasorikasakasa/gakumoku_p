class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:kana_first_name,:kana_last_name])

    # devise_parameter_sanitizer.permit(:account_update, keys: [:name,:self_introduction, :profile_image])
  end
end
