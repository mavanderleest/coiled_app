module OrdersHelper

	def general_info
		if signed_in?
			@user = current_user
  		@order = current_user.orders.build
		end
	end

	def available_orders
		if signed_in?
			general_info
			@orders = current_user.orders.all
		end
	end

	def recent_orders
		if signed_in?
			general_info
			@orders = current_user.orders.all
		end
	end
end