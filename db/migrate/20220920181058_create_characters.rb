class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :dnd_class, null: false, foreign_key: true
      t.belongs_to :race, null: false, foreign_key: true
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.integer :hp
      t.integer :current_hp

      t.timestamps
    end
  end
end
