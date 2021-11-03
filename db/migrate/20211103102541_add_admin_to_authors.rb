class AddAdminToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :admin, :boolean, default: false
  end
end
