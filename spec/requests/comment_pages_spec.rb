# require 'spec_helper'

     
# describe "CommentPages" do
# 	 subject { page }

#     let(:user) { FactoryGirl.create(:user) }

#        before { sign_in user }

#        let!(:a1) { FactoryGirl.create(:activity, user: user) }
       
#         describe " comment creation page" do 
#        	  before { visit root_path }

#        	   it { should have_title("ActivityHelper") }

#        	    describe "with invalid information", :js=>true do

#                 it "should not create a comment" do
#                   expect { click_button "comment" }.not_to change(Comment, :count)
#                 end
#                 describe "error messages" do
#                   before { click_button "comment" }
#                   it { should have_content('error') } 
#                 end
#             end
#             describe "with valid information", :js=>true do

#             before do 
              
#              fill_in "content", with: "i m fine" 
             
#              click_button "comment"
#            end
#             it { should have_content("i m fine") }
#                # expect { click_button "Post" }.to change(Activity, :count).by(1)
#             # end
#         end
#        	end
  
# end
