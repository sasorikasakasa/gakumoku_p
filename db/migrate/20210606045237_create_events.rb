class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|

      t.references :user
      t.references :group

      t.string :name,null: false
      t.text :introduction
      t.datetime :start_time,null: false
      t.datetime :finish_time,null: false
      t.datetime :deadline_time,null: false
      t.integer :max_apply_number
      t.string :icon_image
      t.string :tag_image
      t.string :zoom_url,null: false
      t.timestamps
    end
  end
end
