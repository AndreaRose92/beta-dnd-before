class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :image
      t.integer :level
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :dnd_class, null: false, foreign_key: true
      t.belongs_to :race, null: false, foreign_key: true
      t.integer :Strength
      t.integer :Dexterity
      t.integer :Constitution
      t.integer :Intelligence
      t.integer :Wisdom
      t.integer :Charisma
      t.integer :hp
      t.integer :current_hp

      t.timestamps
    end
  end
end
