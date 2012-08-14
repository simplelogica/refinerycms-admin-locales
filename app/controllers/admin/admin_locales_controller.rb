module Admin
  class AdminLocalesController < Admin::BaseController

    crudify :user,
          :order => 'username ASC',
          :title_attribute => :username,
          :xhr_paging => true

    def update
      locale = params[:user][:locale]
      @user.locale = locale if params[:user][:locale]
      if locale && @user.save
        redirect_to admin_admin_locales_path,
                    :notice => t('updated', :what => @user.username, :scope => 'refinery.crudify')
      else
        render :edit
      end
    end
  end
end
