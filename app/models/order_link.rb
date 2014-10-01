class OrderLink < ActiveRecord::Base
	belongs_to :order
	belongs_to :user
	validates :order_id, presence: true
	validates :user_id, presence: true
end
