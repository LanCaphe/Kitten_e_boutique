class AddItemIdToOrder < ActiveRecord::Migration[5.2]
  def change
      add_column :orders, :item_id, :string
  end
end
