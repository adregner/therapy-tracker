class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :total
      t.belongs_to :company

      t.timestamps
    end
    add_index :invoices, :company_id
  end
end
