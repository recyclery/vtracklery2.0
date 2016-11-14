class WorkersController < ApplicationController

  def index
  end

  def show
    if !current_worker
      redirect_to new_worker_session_path
    end

    if current_worker && current_worker.work_times && current_worker.work_times.last && current_worker.work_times.last.work_end == nil
      @unclosed_shift = current_worker.work_times.last
    end

  end

  def new
    @worker = Worker.new
  end

end
