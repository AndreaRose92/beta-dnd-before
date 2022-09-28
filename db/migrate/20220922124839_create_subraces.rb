class CreateSubraces < ActiveRecord::Migration[7.0]
  def change
    create_table :subraces do |t|
      t.belongs_to :race, null: false, foreign_key: true
      t.string :name
      t.string :api_index
      t.string :url
      t.string :languages
      t.string :traits
      t.integer :Strength
      t.integer :Dexterity
      t.integer :Constitution
      t.integer :Intelligence
      t.integer :Wisdom
      t.integer :Charisma

      t.timestamps
    end
  end
end
