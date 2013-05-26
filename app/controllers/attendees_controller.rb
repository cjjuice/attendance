class AttendeesController < ApplicationController
  layout false
  respond_with :json

  def index
    respond_with current_group.attendees.all
  end

  def show
    respond_with current_group.attendees.find(params[:id])
  end

  def create
    respond_with current_group.attendees.create(params[:attendee])
  end

  def update
    respond_with current_group.attendees.update(params[:id], params[:attendee])
  end

  def destroy
    respond_with current_group.attendees.destroy(params[:id])
  end
end
