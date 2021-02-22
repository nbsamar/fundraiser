class CreateJoinTableUserProfile < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :profiles do |t|
    end
  end
end
