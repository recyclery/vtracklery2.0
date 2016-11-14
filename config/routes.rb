Rails.application.routes.draw do
  devise_for :workers, controllers: {
    sessions: 'workers/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :worker do
    root 'workers#show'
  end


end
