::Refinery::Application.routes.draw do
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    scope(:path => 'admin_locales', :as => 'admin_locales', :module => 'admin_locales') do
      root :to => 'admin_locales#index'
      resources :admin_locales, :only => [:index, :edit, :update]
    end
  end
end
