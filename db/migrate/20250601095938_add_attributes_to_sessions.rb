class AddAttributesToSessions < ActiveRecord::Migration[7.2]
  def change
    add_belongs_to :sessions, :user
    add_column :sessions, :token, :string
  end
end
