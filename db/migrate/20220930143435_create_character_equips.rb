class CreateCharacterEquips < ActiveRecord::Migration[7.0]
  def change
    create_table :character_equips do |t|
      t.belongs_to :character, null: false, foreign_key: true
      t.belongs_to :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
