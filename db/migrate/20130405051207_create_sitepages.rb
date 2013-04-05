class CreateSitepages < ActiveRecord::Migration
  def change
    create_table :sitepages do |t|
      t.string :title
      t.string :maillink
      t.string :image_url
      t.text :content

      t.timestamps
    end
  end
end
