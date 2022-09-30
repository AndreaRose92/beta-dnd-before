class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :image
      t.integer :level
      t.belongs_to :dnd_class, null: false, foreign_key: true
      t.belongs_to :race, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :strength, default: 10
      t.integer :dexterity, default: 10
      t.integer :constitution, default: 10
      t.integer :intelligence, default: 10
      t.integer :wisdom, default: 10
      t.integer :charisma, default: 10
      t.integer :max_hp, default: 20
      t.integer :current_hp, default: 20

      t.timestamps
    end
  end
end
