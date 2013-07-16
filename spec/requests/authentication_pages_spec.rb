require 'spec_helper'

describe "Authentication" do

  subject { page }

    describe "signin page" do
    	before { visit new_user_session_path }

    	it { should have_selector('h1',    text: 'Sign in') }
    	it { should have_title('Sign in') }
    end
    describe "signin" do
    	before { visit new_user_session_path }

    	describe "with invalid information" do
      		before { click_button "Sign in" }

      		it { should have_title('Sign in') }
      		it { should have_content( 'Invalid') }
      		describe "after visiting another page" do
               before { click_link "Activity" }
              it { should_not have_content('invalid') }
            end
        end
        describe "with valid information" do
      		let(:user) { FactoryGirl.create(:user) }
      		before { 
        		fill_in "Email",    with: user.email.upcase
        		fill_in "Password", with: user.password
        		click_button "Sign in"
            }

          

      		it { should have_title("ActivityHelper") }
          #it { should have_link('Sign out', href: users_path)}
      		it { should have_link('profile', href: user_path(user)) }
      		it { should have_link('Sign out', href: destroy_user_session_path) }
         # it { should have_link('Settings', href: edit_user_path(user)) }
      		it { should_not have_link('Login', href: new_user_session_path) }
      	end
      	describe "followed by signout" do 
      		let(:user) { FactoryGirl.create(:user) }
      		before{ sign_in user }
            before { click_link "Sign out", href: destroy_user_session_path }
            it { should have_link('Login', href: new_user_session_path) }
          end
     end
end







# require 'spec_helper'

# describe "activityPages2" do

   

#          subject { page }

#          let(:user) { FactoryGirl.create(:user) }
#          before { sign_in user }

#     describe "activity creation" do
#            before { visit root_path }

#         describe "with invalid information" do

#             it "should not create a activity" do
#               expect { click_button "Post" }.not_to change(Activity, :count)
#             end

#             describe "error messages" do
#               before { click_button "Post" }
#               it { should have_content('error') } 
#             end
#         end

#         describe "with valid information" do

#             before { fill_in "Name", with: "cricket" }
#             it "should create a activity" do
#                expect { click_button "Post" }.to change(Activity, :count).by(1)
#             end
#         end
#     end

# end