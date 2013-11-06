class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.string :log_level

      t.timestamps
    end
  end
end
