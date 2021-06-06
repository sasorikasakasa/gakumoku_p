class CreateUserEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :user_events do |t|

      t.references :user
      t.references :event
      t.boolean :apply_status,default: false,null: false
      t.timestamps
    end
  end
end
