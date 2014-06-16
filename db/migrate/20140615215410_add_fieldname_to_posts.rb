class AddFieldnameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :admin_users_id, :integer
  end
end
