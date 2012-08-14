Refinery::Application.routes.draw do
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :admin_locales, :only => [:index, :edit, :update]
  end
end
