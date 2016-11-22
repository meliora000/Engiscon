class AddKidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kid, :string
  end
end
