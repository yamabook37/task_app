class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required 

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_url unless current_user
  end
  #全てのアクションの前にチェックが入る、このままだと無限にログインできない->sessions_conだけ許可する
end
