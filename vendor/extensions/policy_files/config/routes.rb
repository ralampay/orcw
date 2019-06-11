Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :policy_files do
    resources :policy_files, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :policy_files, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :policy_files, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
