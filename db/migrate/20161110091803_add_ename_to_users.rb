class AddEnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ename, :string
  end
end
