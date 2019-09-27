Rails.application.routes.draw do
  get "/learn", to: "pages#learn"
  get "/about", to: "pages#about"
  get "/rcw_faculty", to: "pages#rcw_faculty"
  get "/ls/sose", to: "pages#sose", as: :sose
  get "/ls/som", to: "pages#som", as: :som
  get "/ls/som/download_organizational_matrix", to: "pages#som_download_organizational_matrix", as: :som_download_organizational_matrix
  get "/ls/soh", to: "pages#soh", as: :soh
  get "/ls/soss", to: "pages#soss", as: :soss
  get "/urc", to: "pages#urc"
  get "/ethics_office", to: "pages#ethics_office"
  get "/intellectual_property_office", to: "pages#aipo"

  # Professional schools
  get "/ps/asog", to: "pages#asog", as: :asog
  get "/ps/agsb", to: "pages#agsb", as: :agsb
  get "/ps/asmph", to: "pages#asmph", as: :asmph
  get "/ps/als", to: "pages#als", as: :als

  # Downloads
  get "/download/compendium", to: "pages#download_compendium"
  get "/download/file", to: "pages#download_file", as: :download_file

  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the
  # configuration option `mounted_path` to something different in config/initializers/refinery/core.rb
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, at: Refinery::Core.mounted_path


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
