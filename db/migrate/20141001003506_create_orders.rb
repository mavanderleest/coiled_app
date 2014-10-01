class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
			t.string :grade
			t.string :notes
			t.integer :order_id
      t.timestamps
    end
    add_index :orders, :order_id
  end
end
