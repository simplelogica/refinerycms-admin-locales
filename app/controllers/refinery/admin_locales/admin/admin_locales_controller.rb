module Refinery
  module AdminLocales
    module Admin
      class AdminLocalesController < ::Refinery::AdminController

        crudify :'refinery/user',
              :order => 'username ASC',
              :title_attribute => 'username',
              :xhr_paging => true

        def update
          locale = params[:user][:locale]
          @user.locale = locale if params[:user][:locale]
          if locale && @user.save
            redirect_to refinery.admin_locales_admin_admin_locales_path,
                        :notice => t('updated', :what => @user.username, :scope => 'refinery.crudify')
          else
            render :edit
          end
        end
      end
    end
  end
end
