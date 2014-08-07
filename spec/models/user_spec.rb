require 'spec_helper'

describe User do
	before { @usr = User.new(name: "arkkra", email: "arkkra@mage.com") }

	subject {@usr}

	it {should respond_to(:name)}
	it {should respond_to(:email)}

	describe "email validations" do
		it "should be invalid" do
			addrs = %w[user@foo,com yolo_swag@bar.net ark.kra@mage.gov]
			addrs.each do |a|
				@usr.email = a
				expect(@usr).not_to be_valid
			end
		end
	end

	describe "email validations" do
		it "should be valid" do
			addrs = %w[yolo@swag.com ARKKRA_best@mage.net user.loser@foo.edu]
			addrs.each do |a|
				@usr.email = a
				expect(@usr).to be_valid
			end
		end
	end

	describe "already registered email" do
		before do
			same_email = @usr.dup
			same_email.email.upcase
			same_email.save
		end

		it {should_not be_valid}
	end

end
