class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :api_index
      t.string :url
      t.string :desc
      t.string :higher_level
      t.string :range
      t.boolean :ritual
      t.string :duration
      t.boolean :concentration
      t.integer :level

      t.timestamps
    end
  end
end
