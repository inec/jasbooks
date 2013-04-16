class AddTaxamtToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :tax_amount, :decimal, :default => 0
  end
end
