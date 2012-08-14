::User.find(:all).each do |user|
  if user.plugins.where(:name => 'refinerycms_admin_locales').blank?
    user.plugins.create(:name => "refinerycms_admin_locales",
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end if defined?(::User)
