class AddChiefIdColumnToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :chief_id, :integer
  end
end
