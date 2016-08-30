class AddImportantReadToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :important_read, :boolean, :default => false
    add_column :site_visits, :important_read, :boolean, :default => false
    add_column :handovers, :important_read, :boolean, :default => false
    add_column :decisions, :important_read, :boolean, :default => false
  end
end
