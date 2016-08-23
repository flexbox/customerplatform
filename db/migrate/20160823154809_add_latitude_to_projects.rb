class AddLatitudeToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :latitude, :float
  end
end
