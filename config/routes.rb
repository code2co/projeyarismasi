Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users
  resources :admissions do
    resources :build, controller: "admissions/build"
    resources :reviews do
      resources :build, controller: "reviews/build"
    end
  end
end
