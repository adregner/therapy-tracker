class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :datetime
      t.integer :duration
      t.belongs_to :client

      t.timestamps
    end
    add_index :visits, :client_id
  end
end
