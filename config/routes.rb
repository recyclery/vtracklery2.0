Rails.application.routes.draw do
  devise_for :workers, controllers: {
    sessions: 'workers/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :worker do
    root 'workers#show'
  end

  post "workers/:id/work_times" => "work_times#create", as: "create_work_time"

  post "workers/:worker_id/work_times/:work_time_id" => "work_times#update", as: "update_work_time"


end
