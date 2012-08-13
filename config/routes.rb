Refinery::Core::Engine.routes.draw do
  namespace :admin_locales, :path => '' do
    namespace :admin, :path => 'refinery' do
      root :to => "admin_locales#index"
      resources :admin_locales, :only => [:index, :edit, :update]
    end
  end
end
