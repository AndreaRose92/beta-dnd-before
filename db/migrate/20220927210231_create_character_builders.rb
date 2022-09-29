class CreateCharacterBuilders < ActiveRecord::Migration[7.0]
  def change
    create_table :character_builders do |t|
      t.belongs_to :dnd_class, null: false, foreign_key: true
      t.string :race_name
      t.integer :level

      t.timestamps
    end
  end
end
