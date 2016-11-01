class ChangeUserIdColumnToOwnerIdColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :restaurants, :user_id, :owner_id
  end
end
