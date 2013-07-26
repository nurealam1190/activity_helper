require 'spec_helper'

describe "Message" do
	let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }
      before { sign_in user1}
      before { sign_in user2}
    before do

    	@friendship= Friendship.find(params[:friendship_id])
		@message= @friendship.messages.build(params[:message])
	
    end 
    subject { @message }

    it { should respond_to(:message)}
    it { should respond_to(:friendship_id)}

    describe "when friendship_id is not present" do
      before { @message.friendship_id = nil }
      it { should_not be_valid }
    end
    describe "when message is not present" do
    before { @message.message = nil }
    it { should_not be_valid }
  end
  
end
