class AddKindToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :kind, :string
  end
end
