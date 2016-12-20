class EventsController < ApplicationController

  def index
    @events = Event.upcomming_events
  end

  def show
    @event = Event.includes(:workers).where(id: params[:id]).first
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      @errors = @event
      render new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to event
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :start_time, :end_time)
  end

end
