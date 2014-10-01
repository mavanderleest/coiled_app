class Order < ActiveRecord::Base
	has_many :order_links
	has_many :users, through: :order_links
	validates :grade, 			presence: true, length: { maximum: 10 }
end
