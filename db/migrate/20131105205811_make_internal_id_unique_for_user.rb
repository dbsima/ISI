class MakeInternalIdUniqueForUser < ActiveRecord::Migration
  def change
     add_index :users, :internal_id, :unique => true
  end
end
