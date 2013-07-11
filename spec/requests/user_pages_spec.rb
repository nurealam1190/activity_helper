require 'spec_helper'

describe "UserPages" do




	subject { page }
  let(:user) { FactoryGirl.create(:user) }

  describe "profile page" do
    
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_title(user.name) }
  end

	describe "signup page" do

  		before { visit new_user_registration_path}

     	it { should have_selector('h1', text:  'Sign up') }
     	it { should have_title('sign up') }

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
               fill_in "Name", with: "Nure Alam"
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
              #it { should have_title(user.name) }
              #it { should have_selector('div.alert.alert-success', text: 'Welcome') }
              #it { should have_link('Sign out') }
            end  
        end
    end
        
     

end