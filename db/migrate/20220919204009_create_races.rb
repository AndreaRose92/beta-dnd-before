class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :name
      t.string :url
      t.string :ability_score_bonuses
      t.string :size
      t.string :languages
      t.string :traits
      t.integer :speed

      t.timestamps
    end
  end
end
