require 'spec_helper'

describe User do

	before do
		@user = User.new(name: "Example User",
										 email: "user@example.com")
	end
	
end