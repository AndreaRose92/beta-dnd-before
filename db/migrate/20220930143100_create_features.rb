class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.belongs_to :dnd_class, null: false, foreign_key: true
      t.belongs_to :dnd_class_level, null: false, foreign_key: true
      t.string :name
      t.string :index
      t.string :desc

      t.timestamps
    end
  end
end
