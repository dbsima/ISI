class CreateAvailableActivities < ActiveRecord::Migration
  def change
    create_table :available_activities do |t|
      t.string :name

      t.timestamps
    end
  end
end
