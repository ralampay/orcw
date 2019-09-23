Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :news_articles do
    resources :news_articles, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :news_articles, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :news_articles, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
