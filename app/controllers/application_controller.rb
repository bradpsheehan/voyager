class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def current_account
    @current_account ||= Account.find_by(user_id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_account

  def authorize
    redirect_to root_path unless current_account
  end
end
