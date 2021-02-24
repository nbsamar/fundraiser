class CreateProfileUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_users do |t|
      t.bigint :user_id, index: true
      t.bigint :profile_id, index: true
    end
  end
end
