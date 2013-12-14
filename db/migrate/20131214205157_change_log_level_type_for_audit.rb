class ChangeLogLevelTypeForAudit < ActiveRecord::Migration
  def change
     change_column :audits, :log_level, :integer
  end
end
