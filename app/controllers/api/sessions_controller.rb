class Api::SessionsController < Api::BaseController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      respond_with true
    else
      respond_with false
    end
  end

  def destroy
    session[:user_id] = nil
    respond_with true
  end
end
