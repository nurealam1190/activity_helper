require 'spec_helper'

describe "Message" do
	let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }
     
    before do

    @friendship=user1.friendships.build(:friend_id => user2.id, status: true)
    @friendship.save!
		@message= user1.messages.build(:message => "hi", recipient_id: user2.id)
        @message.save!
	
    end 
    subject { @message }

    it { should respond_to(:message)}
    it { should respond_to(:recipient_id)}
    it { should respond_to(:friendship)}
    it { should respond_to(:user_id)}
    it { should  be_valid}

    describe "when recipient_id is not present" do
      before { @message.recipient_id = nil }
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
