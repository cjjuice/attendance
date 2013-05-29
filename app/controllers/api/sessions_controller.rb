class Api::SessionsController < Api::BaseController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      respond_with :api, true
    else
      respond_with :api, false
    end
  end

  def destroy
    session[:user_id] = nil
    respond_with :api, true
  end
end
