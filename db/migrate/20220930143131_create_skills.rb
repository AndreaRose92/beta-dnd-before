class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :stat
      t.string :desc
      t.string :index
      t.boolean :is_save

      t.timestamps
    end
  end
end
