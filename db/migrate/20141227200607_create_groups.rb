class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :weekend_value
      t.integer :talk_about_value
      t.integer :social_status_value
      t.integer :meet_value

      t.timestamps null: false
    end
  end
end
