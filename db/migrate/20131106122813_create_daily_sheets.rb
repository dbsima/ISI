class CreateDailySheets < ActiveRecord::Migration
  def change
    create_table :daily_sheets do |t|
      t.string :status
      t.integer :monthly_sheet_id
      t.string :day
      t.string :date

      t.timestamps
    end
  end
end
