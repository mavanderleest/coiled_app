class OrdersController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: :destroy

  def index
  	@user = current_user
  	@order = current_user.orders.build
		@orders = current_user.orders.all
  end

  def create
  	@order = Order.create!(order_params)
  	if @order.save
  		current_user.link!(@order)
  		flash[:success] = "Order created"
	  	redirect_to orders_path
  	end
  end

  def edit
  end

  def update
		if @order.update_attributes(order_params)
			flash[:success] = "Order updated"
			redirect_to current_user
		else
			render 'edit'
		end
  end

	def destroy
		@order.destroy
		OrderLink.destroy_all(order_id: @order.id)
		flash[:success] = "Order deleted"
		redirect_to orders_path
	end

	private

		def order_params
			params.require(:order).permit(:grade, :notes)
		end

		def correct_user
			@order = current_user.orders.find_by_id(params[:id])
			redirect_ to root_path if @order.nil?
		end
end