class StaticPagesController < ApplicationController

	def home
		if signed_in?
			@user = current_user
  		@order = current_user.orders.build
			@orders = current_user.orders.all
		end
	end

	def help
	end

	def about
	end

	def contact
	end
end
