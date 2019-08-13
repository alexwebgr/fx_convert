class CreateFxPairs < ActiveRecord::Migration[5.2]
  def change
    create_table :fx_pairs do |t|
      t.string :base
      t.string :target
      t.string :rate
      t.datetime :last_updated_at

      t.timestamps
    end
  end
end
