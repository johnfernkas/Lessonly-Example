Rails.application.routes.draw do
  get 'companies' => 'companies#index'
  namespace :companies do
    get :alphabetize
  end
end
