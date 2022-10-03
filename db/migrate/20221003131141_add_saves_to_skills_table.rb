class AddSavesToSkillsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :skills, :is_save, :boolean
  end
end
