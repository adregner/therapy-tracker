class ChangeRatesToFloat < ActiveRecord::Migration
  def up
    change_table :visits do |t|
      t.change :duration, :decimal, :precision => 4, :scale => 2
    end
  end

  def down
    change_table :visits do |t|
      t.change :duration, :integer
    end
  end
end
