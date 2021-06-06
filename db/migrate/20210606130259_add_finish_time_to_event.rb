class AddFinishTimeToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :finish_time, :datetime, null: false
  end
end
