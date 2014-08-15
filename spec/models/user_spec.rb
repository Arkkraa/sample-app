require 'spec_helper'

describe User do
	before { @usr = User.new(name: "arkkra", email: "arkkra@mage.com", 
							password: "noobcake", verify_password: "noobcake") }

	subject {@usr}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:password_digest)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:authenticate)}

	it {should be_valid}

	describe "when password isn't present" do
		before { @usr.password_confirmation = "mismatch" }
		it {should_not be_valid}
	end

	describe "when passwords don't match verify" do
		before { @usr = User.new(name: "arkkra", email: "arkkra@mage.net", 
								password: "bestmage", verify_password: "noobcake")}
		it {should_not be_valid}
	end

	describe "email validations" do
		it "should be invalid" do
			addrs = %w[user@foo,com yolo,swag@bar.net ark!kra@mage.gov]
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
