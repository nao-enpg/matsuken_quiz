Rails.application.routes.draw do
  root "sambas#index"
  resources :sambas, only: [:index] do
    collection do
      post :check_answer
      get :show_result
    end
  end
end