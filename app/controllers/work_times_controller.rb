class WorkTimesController < ApplicationController

  def create
    # change this to strong params
    new_work_time = WorkTime.new(worker_id: current_worker.id, work_start: Time.now, event_id: 1, work_type_id: 1)
    if new_work_time.save!
      redirect_to "/"
    else
      @errors = new_work_time.errors.full_messages
      render "/workers/show"
    end
  end

  def update
p "In the method!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    worktime = WorkTime.find(params[:id])
p worktime
    # worktime.update(
    #   work_start: params[:start],
    #   work_end: params[:end]
    #   )

    worktime.assign_attributes(
      work_start: params[:start],
      work_end: params[:end]
      )
p worktime
    if request.xhr? && !worktime.save
      puts "WOOOOOO"
      p worktime.errors.messages.values[0][0]
      render plain: worktime.errors.messages.values[0][0]
    else
      puts worktime.errors.full_messages  
    end
  end

  def end_shift
    work_time = WorkTime.find_by(id: params[:work_time_id])
    work_time.work_end = Time.now
    work_time.save
    redirect_to "/"
  end

  def delete
    worktime = WorkTime.find(params[:id])
    worktime.destroy
  end

  def show
    @worktime = WorkTime.find(params[:id])

    if request.xhr?
      render json: @worktime
    end
  end


  private

  # def work_time_params
  #   params.require(:work_time).permit(:worker, :event, :work_type, :work_start)
  # end

end
