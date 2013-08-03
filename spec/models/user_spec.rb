require 'spec_helper'

describe "user"  do
  	before do 
  	   @user = User.new(name: "exampleuser", username: 'noor', email: "user@example.com", password: "foobarcom", password_confirmation: "foobarcom")
    end
  	  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password)}
	it { should respond_to(:password_confirmation)}
	it { should respond_to(:name)}
  it { should respond_to(:activities)}
  it { should respond_to(:username)}
  it { should respond_to(:messages)}
  it { should respond_to(:recipients)}
  it { should respond_to(:senders)}
  it { should respond_to(:friendships)}
  it { should respond_to(:inverse_friendships)}
  it { should respond_to(:friends)}
  it { should respond_to(:inverse_friends)}

	it { should be_valid }

	describe " when username is not present" do
		before { @user.username = " " }
	    it { should_not be_valid}
	end
	describe " when email is not present" do 
		before { @user.email = " "}
		it { should_not be_valid}
	end
	describe " when username is too long " do 
		before { @user.username = 'a'*31 }
		it { should_not be_valid}
	end
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end
  describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
  end
  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should be_valid }
  end
  describe "with a password that's too short" do
     before { @user.password = @user.password_confirmation = "a" * 5 }
     it { should_not be_valid }
  end
   describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org]
                     
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
      it { should_not be_valid }
  end
  describe "activity associations" do

    before { @user.save }
    let!(:older_activity) do 
      FactoryGirl.create(:activity, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_activity) do
      FactoryGirl.create(:activity, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right activity in the right order" do
      @user.activities.should == [newer_activity, older_activity]
    end
  end
  it "should destroy associated activity" do
      activities = @user.activities.dup
      @user.destroy
      #microposts.should_not be_empty

      activities.each do |activity|
        Activity.find_by_id(activity.id).should be_nil
      end
  end
  


  
end


