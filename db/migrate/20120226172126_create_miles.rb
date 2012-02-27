class CreateMiles < ActiveRecord::Migration
  def change
    create_table :miles do |t|
      t.datetime :date
      t.integer :total_miles

      t.timestamps
    end
  end
end
