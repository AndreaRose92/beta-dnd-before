class CreateCharacterFeats < ActiveRecord::Migration[7.0]
  def change
    create_table :character_feats do |t|
      t.belongs_to :character, null: false, foreign_key: true
      t.belongs_to :feat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
