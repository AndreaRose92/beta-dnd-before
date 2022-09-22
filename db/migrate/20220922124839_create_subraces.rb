class CreateSubraces < ActiveRecord::Migration[7.0]
  def change
    create_table :subraces do |t|
      t.belongs_to :dnd_class, null: false, foreign_key: true
      t.string :name
      t.belongs_to :race, null: false, foreign_key: true
      t.string :url
      t.string :ability_score_bonuses
      t.string :languages
      t.string :traits

      t.timestamps
    end
  end
end
