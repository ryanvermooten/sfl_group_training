class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :area
      t.integer :user_id
      t.integer :avatar

      t.timestamps
    end
  end
end
