class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.belongs_to :company
      t.belongs_to :contact
      t.belongs_to :agency
      t.belongs_to :rate

      t.timestamps
    end
    add_index :clients, :company_id
    add_index :clients, :contact_id
    add_index :clients, :agency_id
    add_index :clients, :rate_id
  end
end
