class User < ActiveRecord::Base
	has_many :order_links
	has_many :orders, through: :order_links
end
