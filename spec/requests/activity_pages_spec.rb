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
             #it { should have_component(text_field_tag) }
		#end
	end
	describe "activity page" do 
		before { visit activity_path }
		it { should have_selector('h1', text: 'activity page')}
		it { should have_title( full_title(' '))}
		it { should_not have_title('|page')}

	end
  
end

