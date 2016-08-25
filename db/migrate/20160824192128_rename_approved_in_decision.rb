class RenameApprovedInDecision < ActiveRecord::Migration[5.0]
  def change
    rename_column :decisions, :approved, :status
  end
end
