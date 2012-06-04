class ChangeVisitsToFloat < ActiveRecord::Migration
  def up
    change_table :rates do |t|
      t.change :value, :decimal, :precision => 6, :scale => 2
    end
  end

  def down
    change_table :rates do |t|
      t.change :value, :integer
    end
  end
end
