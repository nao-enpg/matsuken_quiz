Rails.application.routes.draw do
  get 'static_pages/terms_of_service', as: 'terms_of_service'
  get 'static_pages/privacy_policy', as: 'privacy_policy'
  root "sambas#index"
  resources :sambas, only: [:index] do
    collection do
      post :check_answer
      get :show_result
    end
  end
end