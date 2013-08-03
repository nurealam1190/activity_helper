require 'spec_helper'

describe "MessagePages", :js => true do

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
    describe " friend" do 
	    before do
	    	sign_in user1
	        @friendship=user1.friendships.build(:friend_id => user2.id, :status => true)
	        @friendship.save
	        visit user_path(user2)
	    end
	    it { should have_content("friend")}
	    it { should have_link("send messages")}

	    describe "message creation" do 
	    	before do 
	    		 click_on("send messages")
	    	end
	    	it { should have_button("Send")}

	    	describe "with invalid information", :js=> true do  
		        it "should not create a message" do
		          expect { click_button "Send" }.not_to change(Message, :count)
		        end
		        describe "error messages" do
		          before { click_button "Send" }
		          it { should have_content("message can't sent") } 
		        end
		    end

	    	describe "with valid information" do
	    	    before do 
	    		   fill_in "message[message]", with: "hello...! how r u...?"
	    		   click_button "Send"
	    		end
	    		it { should have_content("message sent")}

		    	describe " check message status" do 
		            before { visit user_path(user1)}
			        it { should have_link("see sent messages")}
		            before do 
		               click_on("see sent messages")
		            end
		            it { should have_content("hello...! how r u...?")}
	            end

	            describe "signout user1" do 
	            	before { visit destroy_user_session_path}
	            	it { should have_title("ActivityHelper")}
	                describe "reciver msg status" do 
	                	before { sign_in user2}
	                	before { visit user_path(user2)}
	                	it { should have_title(user2.username)}
	                	it { should have_link("see recived messages")}
	                	before do 
	                      click_on("see recived messages")
	                    end
				            	  
	                    it { should have_content("hello...! how r u...?")}
	                end
	            end
	    	end
	    end 
    end
end
