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
    # update this to actually change the relevant work time
    puts "in the update method"
    p params
  end

  def end_shift
    work_time = WorkTime.find_by(id: params[:work_time_id])
    work_time.work_end = Time.now
    work_time.save
    redirect_to "/"
  end


  private

  # def work_time_params
  #   params.require(:work_time).permit(:worker, :event, :work_type, :work_start)
  # end

end
