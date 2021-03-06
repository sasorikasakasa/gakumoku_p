class EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @new_event = Event.new
    @own_group = Group.where(leader_user_id: current_user.id)
  end

  def index
    @all_event = Event.all
  end

  def create
    @new_event = Event.new(event_params)
    @new_event.save
    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
  end

  def applies
    @event = Event.find(params[:id])
    @applies = @event.user_events.includes(:user).where(apply_status: true)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def apply_status_update
    event = Event.find(params[:id])
    if event.deadline_time > DateTime.new()
      user_event = UserEvent.find_or_create_by(user_id: current_user.id,event_id: event.id)
      user_event.update(apply_status: !user_event.apply_status)
      redirect_to event_path(event.id)
    else
      redirect_to events_path
    end
  end


  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name,:introdutcion,:start_time,:finish_time,:deadline_time,:max_apply_number,:icon_image,:tag_image,:group_id,:zoom_url)
  end

end
