Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :downloadable_forms do
    resources :downloadable_forms, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :downloadable_forms, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :downloadable_forms, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
