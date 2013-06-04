class Api::AttendeesController < Api::BaseController
  def index
    respond_with :api, current_group.attendees.all
  end

  def show
    respond_with :api, current_group.attendees.find(params[:id])
  end

  def create
    respond_with :api, current_group.attendees.create(params[:attendee])
  end

  def destroy
    respond_with :api, current_group.attendees.destroy(params[:id])
  end
  
  def checkin
    attendee = current_group.attendees.where(name: params[:name]).first
    attendee.here = true
    attendee.save
    respond_with :api, attendee
  end
  
  def reset
    respond_with :api, current_group.attendees.each {|a| a.here = false ; a.save} 
  end  
end
