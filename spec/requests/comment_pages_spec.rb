require 'spec_helper'

     
describe "CommentPages" do

	subject { page }
  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }
      
  describe "activity creation", :js=> true do
    
    before { visit root_path }

    describe "with valid information" do
      before do 
  	    select "Sports", from: "Category"
  	    fill_in "Name", with: "cricket" 
  	    fill_in "Description", with: "hi"
  	    click_button "Post"
      end
  	  it { should have_content("cricket") }
      it { should have_link("comment") }

      describe " comment creation on activity" do 
        before do 
          click_on("comment")
          fill_in "comment[content]", with: "hello"
          page.execute_script("$('form#create_comment_form').submit()")
        end
        it { should have_content("hello") }
      end
    end
  end
end
             # expect { click_button "Post" }.to change(Activity, :count).by(1)
            # end
      

       # let!(:a1) { FactoryGirl.create(:activity, user: user) }
       
        
       # 	   it { should have_title("ActivityHelper") }

        	    
        
       #      it { should have_content("i m fine") }
       #         # expect { click_button "Post" }.to change(Activity, :count).by(1)
       #      # end
          
  
