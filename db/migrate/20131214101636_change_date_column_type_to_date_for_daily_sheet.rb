class ChangeDateColumnTypeToDateForDailySheet < ActiveRecord::Migration
  def change
     change_column :daily_sheets, :date, :date
  end
end
