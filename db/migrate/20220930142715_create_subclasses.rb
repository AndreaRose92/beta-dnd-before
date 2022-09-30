class CreateSubclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :subclasses do |t|
      t.string :name
      t.string :flavor
      t.string :desc
      t.string :index
      t.belongs_to :dnd_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
