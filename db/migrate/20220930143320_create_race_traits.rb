class CreateRaceTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :race_traits do |t|
      t.belongs_to :race, null: false, foreign_key: true
      t.belongs_to :trait, null: false, foreign_key: true

      t.timestamps
    end
  end
end
