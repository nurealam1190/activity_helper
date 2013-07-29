require 'spec_helper'

describe "Message" do
	let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }
     
    before do

    @friendship=user1.friendships.build(:friend_id => user2.id)
    @friendship.save!
		@message= @friendship.messages.build(:message => "hi")
	
    end 
    subject { @message }

    it { should respond_to(:message)}
    it { should respond_to(:friendship_id)}
    it { should  be_valid}

    describe "when friendship_id is not present" do
      before { @message.friendship_id = nil }
      it { should_not be_valid }
    end
    describe "when message is not present" do
    before { @message.message = nil }
    it { should_not be_valid }
   end
    describe "when message is too short" do
    before { @message.message = 'a' }
    it { should_not be_valid }
    end
  
end
