Rails.application.routes.draw do

  mount EventCapture::Engine => "/event_capture"
end
