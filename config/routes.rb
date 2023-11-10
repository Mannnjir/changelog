Rails.application.routes.draw do

  mount_at = Changelog::Engine.config.mount_at

  namespace :changelog do
    get :release_notes
    get :current_release
  end

  match mount_at, to: 'changelog#release_notes', via: [:get, :post]
  
end