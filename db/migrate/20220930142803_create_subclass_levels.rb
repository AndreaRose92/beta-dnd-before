class CreateSubclassLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :subclass_levels do |t|
      t.belongs_to :dnd_class_level, null: false, foreign_key: true
      t.belongs_to :subclass, null: false, foreign_key: true
      t.string :index
      t.string :subclass_specific
      t.string :feature_names

      t.timestamps
    end
  end
end
