class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find[params[:id]]
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

  def update
    event = Event.find([param[:id]])
    event.update(event_params)
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :start_time, :end_time)
  end

end
