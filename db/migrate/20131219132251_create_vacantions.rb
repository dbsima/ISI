class CreateVacantions < ActiveRecord::Migration
  def change
    create_table :vacantions do |t|
      t.string :type
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
