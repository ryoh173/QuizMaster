Rails.application.routes.draw do
  get 'quiz_mode/index'
  get 'top/index'
  resources :questions do
    post :answer, on: :member
  end

  root 'top#index'
end
