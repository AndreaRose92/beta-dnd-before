class CreateFeats < ActiveRecord::Migration[7.0]
  def change
    create_table :feats do |t|

      t.timestamps
    end
  end
end
