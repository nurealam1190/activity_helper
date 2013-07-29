require 'spec_helper'

describe "FriendshipPages", :js => true do

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
         describe "pending request" do 
                before { sign_in user1}
                before do
                  @friendship=user1.friendships.build(:friend_id => user2.id)
                end
                before do 
                    @friendship.save!
                end
                before { visit user_path(user2)}
                it { should have_content("request already sent")}

                # describe "sign out user1" do 
                #     before { visit destroy_user_session_path}
                #     it { should have_title("ActivityHelper")}

                #     describe "user2 friendship status" do 
                #         before { sign_in user2}
                #         before { visit user_path(user2)}

                #         it { should have_link("see-friends list")}
                #         before do 
                #             click_on("see-friends list")
                #         end
                #         it { should have_content("Friend Requested")}
                #         it { should have_link("Accept")}
                #         it { should have_link("Decline")}
                #         before do 
                #             click_on("Accept")
                #         end
                #         it { should have_link("see-friends list")}
                #         before do 
                #             click_on("see-friends list")
                #         end
                #         it { should have_link(user1.username)}
                #     end
                # end
        end
        describe "already friend" do 
            before { sign_in user1}
            before do
                @friendship=user1.friendships.build(:friend_id => user2.id, :status => true)
                @friendship.save!
            end
            before { visit user_path(user2)}
            it { should have_content("friend")}

        end
        describe "with friendship accept" do

                before { sign_in user2}
                describe "accept" do 
                        before { visit user_path(user2)}

                        it { should have_link("see-friends list")}
                end
                describe "with friend request" do 
                         before { visit user_path(user2)}
                        before { click_on("see-friends list")}

                        it { should have_content("Friends")}
                        it { should have_content("Friend Requested")}
                       
                end
        end

                
end
