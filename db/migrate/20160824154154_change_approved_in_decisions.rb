class ChangeApprovedInDecisions < ActiveRecord::Migration[5.0]
  def change
    change_column :decisions, :approved, :string
  end
end
