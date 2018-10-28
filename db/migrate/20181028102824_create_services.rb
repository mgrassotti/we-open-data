class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.string :path
      t.text :subpaths
      t.text :description
      t.string :version
      t.string :data_source
    end
  end
end
