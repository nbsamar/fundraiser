class ChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :campaigns, :purpose, :text
  end
end
