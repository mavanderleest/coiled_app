module OrdersHelper

	def general_info
		if signed_in?
			@user = current_user
  		@order = current_user.orders.build
		end
	end

	def available_orders
		general_info
		if signed_in?
			@orders = current_user.orders.all
		end
	end

	def recent_orders
		general_info
		if signed_in?
			@orders = current_user.orders.all
		end
	end
end