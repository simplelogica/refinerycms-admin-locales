class AddLocaleToUser < ActiveRecord::Migration

  def self.up
    add_column :users, :locale, :string

    load(Rails.root.join('db', 'seeds', 'refinerycms_admin_locales.rb').to_s)
  end

  def self.down
    remove_column :users, :locale
  end

end
