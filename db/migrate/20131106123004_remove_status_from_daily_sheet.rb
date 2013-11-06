class RemoveStatusFromDailySheet < ActiveRecord::Migration
  def change
     remove_column :daily_sheets, :status, :string
  end
end
