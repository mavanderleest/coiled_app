require 'spec_helper'

describe Order do

	before do
		@order = Order.new(grade: "100",
										 	 notes: "test order")
	end

	subject { @order }

	it { should respond_to(:grade) }
	it { should respond_to(:notes) }
	it { should respond_to(:id) }
	it { should respond_to(:order_links) }
	it { should respond_to(:users) }

	it { should be_valid }

	describe "with no grade" do
		before { @order.grade = " " }
		it { should_not be_valid }
	end

	describe "with grade too long" do
		before { @order.grade = "a" * 11 }
		it { should_not be_valid }
	end
end