class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :categories, :option, :main
  end
end
