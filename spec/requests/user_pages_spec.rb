 require 'spec_helper'

  describe "UserPages" do




	   subject { page }

     let(:user) { FactoryGirl.create(:user) }

     before { sign_in user }
     
     


      describe "Activity creation page" do
   

        let!(:a1) { FactoryGirl.create(:activity, user: user) }
        let!(:a2) { FactoryGirl.create(:activity, user: user) }

               before { visit root_path }
              it { should have_title("ActivityHelper") }
       
        describe "activities" do
            it {should_not have_content("Welcome to the Activity")}
            it {should have_link("Sign out")}
           it { should have_content(a1.name) }
           it { should have_content(a2.name) }
           it { should have_content(a1.category) }
           it { should have_content(a2.category)}
           it { should have_content(a1.description)}
           it { should have_content(a2.description)}
        end
        describe "profile page" do 
          before { visit user_path(user) }
           it { should have_content(user.name)}
           it { should have_content(user.activities.count)}
           it { should have_content(a1.name)}
           it { should have_content(a2.name)}
           it { should have_content(a1.category)}
           it { should have_content(a2.category)}
           it { should have_content(a1.description)}
           it { should have_content(a2.description)}

        end
        

         describe "with invalid information", :js=>true do

            it "should not create a activity" do
              expect { click_button "Post" }.not_to change(Activity, :count)
             end
             describe "error messages" do
                before { click_button "Post" }
                it { should have_content('error') } 
              end
          end

        describe "with valid information", :js=>true do

            before do 
              select "Sports", from: "Category"
             fill_in "Name", with: "cricket" 
             fill_in "Description", with: "hi"
             click_button "Post"
           end
            it { should have_content("cricket") }
               # expect { click_button "Post" }.to change(Activity, :count).by(1)
            # end
        end
    end

# 	describe "signup page" do

#   		before { visit new_user_registration_path}

#      	it { should have_selector('h1', text:  'Sign up') }
#      	it { should have_title('sign up') }

#     end
   
  
  

#     describe "signup page" do
#        #let(:user) { FactoryGirl.create(:user) }
#             before { visit new_user_registration_path }
#             let(:submit) { "create my account" }
#         describe "with invalid information" do
#             it "should not create a user" do
#             expect { click_button submit }.not_to change(User, :count)
#           end
#         end
#         describe "with valid information" do
#             before do 
#                fill_in "Name", with: "Nure Alam"
#                fill_in "Email", with: "nurealam@akaruilabs.com"
#                fill_in "Password", with: "foobar123"
#                fill_in "Confirmation", with: "foobar123"
#             end
#            it "should create a user" do
#                expect { click_button submit }.to change(User, :count).by(1)
#            end
#             describe "after saving the user" do
#               before { click_button submit }
#               let(:user) { User.find_by_email('abhijeet.misra@gmail.com') }
#               #it { should have_title(user.name) }
#               #it { should have_selector('div.alert.alert-success', text: 'Welcome') }
#               #it { should have_link('Sign out') }
#             end  
#         end
#     end
        
     

end