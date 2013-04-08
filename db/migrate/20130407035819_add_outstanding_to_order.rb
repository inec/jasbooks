class AddOutstandingToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :is_outstanding, :boolean, :default => true
  end
end
