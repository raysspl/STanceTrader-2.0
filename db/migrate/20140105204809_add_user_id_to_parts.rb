class AddUserIdToParts < ActiveRecord::Migration
  def change
    add_column :parts, :user_id, :integer
    add_index :parts, :user_id
  end
end
