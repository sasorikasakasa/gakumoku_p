class CreateUserGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_groups do |t|


      t.references :user
      t.references :group
      t.boolean :follow_status,default: false,null: false
      t.boolean :join_status,default: false,null: false


      t.timestamps
    end
  end
end
