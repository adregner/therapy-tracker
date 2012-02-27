class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :value

      t.timestamps
    end
  end
end
