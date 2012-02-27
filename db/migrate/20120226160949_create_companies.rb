class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.belongs_to :contact

      t.timestamps
    end
    add_index :companies, :contact_id
  end
end
