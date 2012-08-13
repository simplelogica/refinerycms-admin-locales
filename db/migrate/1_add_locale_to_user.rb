class AddLocaleToUser < ActiveRecord::Migration

  def up
    add_column :refinery_users, :locale, :string
  end

  def down
    remove_column :refinery_users, :locale, :string
  end

end
