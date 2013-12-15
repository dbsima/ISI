class AddReasonColumnToMonthlySheet < ActiveRecord::Migration
  def change
    add_column :monthly_sheets, :reason, :string
  end
end
