class Order < ActiveRecord::Base
	has_many :order_links
	has_many :users, through: :order_links
end
