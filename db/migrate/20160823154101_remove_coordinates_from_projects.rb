class RemoveCoordinatesFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :coordinates, :string
  end
end
