class CreateCharSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :char_spells do |t|
      t.belongs_to :character, null: false, foreign_key: true
      t.belongs_to :spell, null: false, foreign_key: true

      t.timestamps
    end
  end
end
