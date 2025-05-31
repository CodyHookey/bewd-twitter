class AddIndexToUsernameAndEmail < ActiveRecord::Migration[7.2]
  def change
    add_index :users, [:username, :email], unique: true
  end
end
