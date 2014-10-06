class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_save :create_remember_token

	has_many :order_links
	has_many :orders, through: :order_links

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

	def linked?(order)
    order_links.find_by_order_id(order.id)
  end

  def link!(order)
    order_links.create!(order_id: order.id)
  end

  def unlink!(order)
    order_links.find_by_order_id(order.id).destroy
  end

	private

	  def create_remember_token
	    self.remember_token = SecureRandom.urlsafe_base64
	  end
end
