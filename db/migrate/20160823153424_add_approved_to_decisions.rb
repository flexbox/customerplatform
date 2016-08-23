class AddApprovedToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :approved, :boolean
  end
end
