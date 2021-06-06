class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|

      t.references :user
      t.references :group

      t.string :event_name,null: false
      t.text :event_introduction
      t.datetime :start_time,null: false
      t.datetime :deadline_time,null: false
      t.integer :limit_num
      t.string :event_image
      t.string :event_tag_image
      t.timestamps
    end
  end
end
