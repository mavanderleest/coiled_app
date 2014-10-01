require 'spec_helper'

describe OrderLink do
	
	before do
		@order_link = OrderLink.new(order_id: 1,
										 	 					user_id: 1)
	end

	subject { @order_link }

	it { should respond_to(:order_id) }
	it { should respond_to(:user_id) }

	it { should be_valid }

	describe "with no order id" do
		before { @order_link.order_id = " " }
		it { should_not be_valid }
	end

	describe "with no user id" do
		before { @order_link.user_id = " " }
		it { should_not be_valid }
	end
end