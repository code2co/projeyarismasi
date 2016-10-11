Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'welcome#index'
  get "reviews/my_reviews", to: "reviews#my_reviews", as: 'my_reviews'

  resources :admissions do
    get 'reviewer_select', on: :member
    get "my", on: :collection
    get 'awaiting', on: :collection
    resources :build, controller: "admissions/build"
    resources :reviews do
      resources :build, controller: "reviews/build"
    end
  end

end
