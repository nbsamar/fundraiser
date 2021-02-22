class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :purpose
      t.float :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
