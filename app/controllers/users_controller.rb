class UsersController < ApplicationController
  respond_to :json

  def create
    user = User.create(params[:user])
    session[:user_id] = user.id if user.save
    respond_with user
  end
end
