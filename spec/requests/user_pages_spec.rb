require 'spec_helper'

describe "UserPages" do
	let(:base_title) {"Arkkra's Website"}

	subject {page}

	describe "signup new user" do
		before {visit signup_path}
		it {should have_content("Sign Up")}
		it {should have_title("#{base_title} | Sign Up")}
  	end
end
