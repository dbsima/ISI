class CreateMonthlySheets < ActiveRecord::Migration
  def change
    create_table :monthly_sheets do |t|
      t.date :month
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
