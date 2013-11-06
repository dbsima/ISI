class AddActivityToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :activity, :string
  end
end
