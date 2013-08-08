require 'spec_helper'

describe "Message2Pages", :js=> true do
  subject { page }

	let(:user1) { FactoryGirl.create(:user) }
	let(:user2) { FactoryGirl.create(:user) }
    describe "friendship creation" do
                before { sign_in user1 }
        	before { visit user_path(user2) }

        	it { should have_title(user2.username)}
        	it { should have_button("add-as-friend")}
        	it { should have_content(user2.username)}
        	it { should have_link("see-friends list")}

        	describe " send request" do
        		it "should  send friend request" do 
        		      expect do
                        click_button "add-as-friend"
                        end.to change(Friendship, :count).by(1)
        		end
        		
        	end
    end
    describe "friend" do
        before do
	    	sign_in user1
	        @friendship=user1.friendships.build(:friend_id => user2.id, :status => true)
	        @friendship.save
	        visit messages_path
	    end 
	    it { should have_content("Friends")}
	    it { should have_content("Messages")}
	    it { should have_button("Send")}
	    it { should have_link(user1.inverse_friends.username)}
    end

end
