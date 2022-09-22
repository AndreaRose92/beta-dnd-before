class CreateDndClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :dnd_classes do |t|
      t.string :name
      t.string :url
      t.integer :hit_die
      t.string :recommended_stat_one
      t.string :recommended_stat_two

      t.timestamps
    end
  end
end
