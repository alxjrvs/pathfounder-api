Rails.application.routes.draw do
  root to: "api/v1/characters#show"
  namespace :api do
    namespace :v1 do
      resources :characters, only: [:create, :show, :update, :destroy] do
        resources :skill_lists, only: [:index, :create, :show, :update]
        resources :stat_blocks, only: [:index, :create, :show, :update]
        resources :pf_classes, only: [:index, :create, :show, :update]
        resources :races, only: [:index, :create, :show, :update]
        resources :feat_lists, only: [:index, :create, :show, :update]
        resources :armories, only: [:index, :create, :show, :update]
      end
    end
  end
end
