class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_group
    @current_group ||= Group.find(params[:group_id]) if params[:group_id]
  end
  helper_method :current_group

  def authorize
    render json: {errors: "not authorized"} if current_user.nil?
  end
end
