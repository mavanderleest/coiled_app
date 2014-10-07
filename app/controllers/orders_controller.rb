class OrdersController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: :destroy

  def index
  	available_orders
  	respond_to do |format|
			format.html
			format.csv { send_data @orders.to_csv }
			format.xls { send_data @orders.to_csv(col_sep: "\t") }
		end
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
			redirect_to orders_path
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

	def import
		Order.import(params[:file],current_user)
		flash[:warning] = "Orders imported."
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