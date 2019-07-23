class ApplicationController < ActionController::Base
  before_action :current_user
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end
end
