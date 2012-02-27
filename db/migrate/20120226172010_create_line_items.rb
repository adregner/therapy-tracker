class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :invoice
      t.belongs_to :visit

      t.timestamps
    end
    add_index :line_items, :invoice_id
    add_index :line_items, :visit_id
  end
end
