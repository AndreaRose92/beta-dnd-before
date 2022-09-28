class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :name
      t.string :api_index
      t.string :url
      t.integer :Strength
      t.integer :Dexterity
      t.integer :Constitution
      t.integer :Intelligence
      t.integer :Wisdom
      t.integer :Charisma
      t.string :size
      t.string :languages
      t.string :traits
      t.integer :speed

      t.timestamps
    end
  end
end
