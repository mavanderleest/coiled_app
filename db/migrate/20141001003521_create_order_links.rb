class CreateOrderLinks < ActiveRecord::Migration
  def change
    create_table :order_links do |t|
			t.integer :order_id
			t.integer :user_id
      t.timestamps
    end
    add_index :order_links, :order_id
    add_index :order_links, :user_id
    add_index :order_links, [:user_id, :order_id]
  end
end
