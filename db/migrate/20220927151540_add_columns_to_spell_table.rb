class AddColumnsToSpellTable < ActiveRecord::Migration[7.0]
  def change
    add_column :spells, :casting_time, :string
    add_column :spells, :damage_type, :string
    add_column :spells, :dc, :string
  end
end
