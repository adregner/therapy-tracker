class RemoveLineItems < ActiveRecord::Migration
  def up
    remove_index :line_items, :column => "invoice_id"
    remove_index :line_items, :column => "visit_id"
    drop_table :line_items
  end

  def down
    create_table :line_items do |t|
      t.belongs_to :invoice
      t.belongs_to :visit

      t.timestamps
    end
    add_index :line_items, :invoice_id
    add_index :line_items, :visit_id
  end
end
