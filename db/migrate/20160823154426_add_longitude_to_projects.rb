class AddLongitudeToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :longitude, :float
  end
end
