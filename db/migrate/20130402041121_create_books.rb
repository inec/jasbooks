class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :list_price

      t.timestamps
    end
  end
end
