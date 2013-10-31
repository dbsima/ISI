class AddDepartmentIdColumnToUser < ActiveRecord::Migration
   #rails g migration AddDepartmentIdColumnToUser department_id:integer

  def change
    add_column :users, :department_id, :integer
  end
end
