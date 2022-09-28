class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.string :name
      t.string :url
      t.string :api_index
      t.string :desc
      t.integer :level
      t.integer :dnd_class_id

      t.timestamps
    end
  end
end
