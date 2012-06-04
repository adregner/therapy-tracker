class AddInvoiceIdToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :invoice_id, :integer
    add_index :visits, :invoice_id
  end
end
