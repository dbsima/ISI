class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :number_of_hours
      t.string :type
      t.integer :user_id
      t.integer :project_id
      t.string :description
      t.integer :daily_sheet_id

      t.timestamps
    end
  end
end
