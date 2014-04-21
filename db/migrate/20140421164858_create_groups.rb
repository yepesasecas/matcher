class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :leader_id
      t.integer :companion_one_id
      t.integer :companion_two_id

      t.timestamps
    end
  end
end
