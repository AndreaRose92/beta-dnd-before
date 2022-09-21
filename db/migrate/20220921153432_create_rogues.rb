class CreateRogues < ActiveRecord::Migration[7.0]
  def change
    create_table :rogues do |t|

      t.timestamps
    end
  end
end
