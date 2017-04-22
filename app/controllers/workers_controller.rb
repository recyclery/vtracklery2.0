class WorkersController < ApplicationController

  def index
    @admins = UserRole.find_by(role: "Admin").workers
    @volunteers = UserRole.find_by(role: "Volunteer").workers
  end

  def show
    if !current_worker
      redirect_to new_worker_session_path
    end


    if current_worker && current_worker.work_times && current_worker.work_times.last && current_worker.work_times.last.work_end == nil
      @work_time = current_worker.work_times.last
      @unclosed_shift = current_worker.work_times.last
    else
      @work_time = WorkTime.new
    end

    @worker = Worker.find(params[:worker_id])
  end

  def new
    @worker = Worker.new
  end

end
