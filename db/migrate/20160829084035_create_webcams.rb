class CreateWebcams < ActiveRecord::Migration[5.0]
  def change
    create_table :webcams do |t|
      t.string :title
      t.string :url
      t.references :project
    end
  end
end
