class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url

      t.timestamps

      t.belongs_to :orders, :carts
    end
  end
end
