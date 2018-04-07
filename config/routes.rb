Rails.application.routes.draw do
  get 'companies' => 'companies#index'
  namespace :companies do
    get :alphabetize
    get :with_modern_plan
  end
end
