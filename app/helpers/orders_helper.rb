module OrdersHelper

	def available_orders
		if signed_in?
			@user = current_user
  		@order = current_user.orders.build
			@orders = current_user.orders.all
		end
	end
end