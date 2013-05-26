class Api::GroupsController < AApi::BaseController
  def index
    respond_with current_user.groups.all
  end

  def show
    respond_with current_user.groups.find(params[:id])
  end

  def create
    respond_with current_user.groups.create(params[:group])
  end

  def update
    respond_with current_user.groups.update(params[:id], params[:group])
  end

  def destroy
    respond_with current_user.groups.destroy(params[:id])
  end
end
