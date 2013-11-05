class AddInternalIdToUsers < ActiveRecord::Migration
  def change
     add_column :users, :internal_id, :string
  end
end
