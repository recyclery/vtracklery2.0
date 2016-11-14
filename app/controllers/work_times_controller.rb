class WorkTimesController < ApplicationController

  def create
    # change this to strong params
    new_work_time = WorkTime.new(worker_id: current_worker.id, work_start: Time.now, event_id: 1, work_type_id: 1)
    if new_work_time.save!
      p new_work_time.id
      redirect_to "/"
    else
      @errors = new_work_time.errors.full_messages
      render "/workers/show"
    end
  end

  def update
  end


  private

  # def work_time_params
  #   params.require(:work_time).permit(:worker, :event, :work_type, :work_start)
  # end

end