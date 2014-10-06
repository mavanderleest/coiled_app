class FixOrderIdForOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :order_id
  	remove_column :users, :user_id
  end
end
