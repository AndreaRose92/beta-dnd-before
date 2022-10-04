class CreateClassEquips < ActiveRecord::Migration[7.0]
  def change
    create_table :class_equips do |t|
      t.belongs_to :dnd_class, null: false, foreign_key: true
      t.belongs_to :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
