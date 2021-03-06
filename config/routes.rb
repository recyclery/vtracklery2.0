Rails.application.routes.draw do
  devise_for :workers, controllers: {
    sessions: 'workers/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events do
  end


  root 'application#index'

  get "workers" => "workers#index", as: "workers"

  get "workers/:worker_id" => "workers#show", as: "worker_show"


  post "workers/:id/work_times" => "work_times#create", as: "create_work_time"

  post "workers/:worker_id/work_times/:work_time_id" => "work_times#end_shift", as: "end_work_time"

  patch "work_times/:id" => "work_times#update"

  get "work_times/:id" => "work_times#show"

  post "work_times/delete/:id" => "work_times#delete"

end
