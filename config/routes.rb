EventCapture::Engine.routes.draw do
  # server api
  resources :events, only: :create
end
