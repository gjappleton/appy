class ChangeUsersTableToOwnersTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :users, :owners
  end
end
