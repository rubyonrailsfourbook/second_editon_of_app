require 'spec_helper'

describe User do
	before do
		@user = User.new(name: 'Steve Jobs', email: 'stevejobs@apple.com',  password: 'stevejobs123', password_confirmation: 'stevejobs123')
	end

	subject { @user }

	it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:articles) }

	describe "should require a name" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "should require a email" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "should require a password" do
		before do 
			@user.password = " " 
			@user.password_confirmation  = " "
		end
		it { should_not be_valid }
	end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com fail wahile.2341.adj@,e23 wed.jjda3]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end
end
