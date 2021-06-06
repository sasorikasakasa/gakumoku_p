class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|

      t.string :group_name,null: false
      t.text :group_introduction
      t.string :group_image
      t.integer :leader_user_id

      t.timestamps
    end
  end
end
