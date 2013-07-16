require 'spec_helper'

describe "ActivityPages" do

	subject { page }



	describe"home page" do
		#it "should have the content'activity helper'" do
			before { visit root_path }
			 it { should have_selector('h1', text: 'Activity Helper') }
             it { should have_title(full_title('')) }
             it { should_not have_title('| home') }
             it { should have_link('Login') }
             it { should have_link('Register/Sign-up') }
             
		#end
	end
	describe "activity page" do 
		before { visit activity_pages_activity_path }
		it { should have_selector('h1', text: 'activity page')}
		it { should have_title( full_title(' '))}
		it { should_not have_title('|page')}

	end
	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }

    
       before { visit user_path(user) }

       it { should have_selector('h3',    text: user.username) }
       it { should have_title(user.username) }
    end
	
  

    describe "signup page" do
       #let(:user) { FactoryGirl.create(:user) }
            before { visit new_user_registration_path }
            let(:submit) { "create my account" }
        describe "with invalid information" do
            it "should not create a user" do
            expect { click_button submit }.not_to change(User, :count)
          end
        end
        describe "with valid information" do
            before do 
               fill_in "Username", with: "Nure Alam"
               fill_in "Email", with: "nurealam@akaruilabs.com"
               fill_in "Password", with: "foobar123"
               fill_in "Confirmation", with: "foobar123"
            end
           it "should create a user" do
               expect { click_button submit }.to change(User, :count).by(1)
           end
            describe "after saving the user" do
              before { click_button submit }
              let(:user) { User.find_by_email('abhijeet.misra@gmail.com') }
              it { should have_title('ActivityHelper') }
              #it { should have_selector('div.alert.alert-success', text: 'Welcome') }
              it { should have_link('Sign out') }
            end  
        end
    end

  
end

