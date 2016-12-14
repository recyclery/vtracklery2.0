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
    puts "In the update method!!!!!!!!!!!!!!!!!"
    worktime = WorkTime.find(params[:id])

    worktime.update(
      work_start: params[:start],
      work_end: params[:end]
      )
    puts "Saving!!!!!!!!!!!!!!!!!"
    worktime.save
  end

  def end_shift
    work_time = WorkTime.find_by(id: params[:work_time_id])
    work_time.work_end = Time.now
    work_time.save
    redirect_to "/"
  end


  def show
    @worktime = WorkTime.find(params[:id])

    if request.xhr?
      render json: @worktime
    end
  end


  def delete
    worktime = WorkTime.find(params[:id])
    worktime.destroy
  end


  private

  # def work_time_params
  #   params.require(:work_time).permit(:worker, :event, :work_type, :work_start)
  # end

end
