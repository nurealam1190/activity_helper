require 'spec_helper'

describe "Activity" do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
    
    @activity = user.activities.build(name: "cricket", description: "hi", category: "sports")
  end

  subject { @activity }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:category)}
  it { should respond_to(:description)}
  it { should respond_to(:user) }
  its(:user) { should == user }

  #it { should be_valid}

  describe "when user_id is not present" do
    before { @activity.user_id = nil }
    it { should_not be_valid }
  end
  # describe "accessible attributes" do
  #   it "should not allow access to user_id" do
  #     expect do
  #       Activity.new(user_id: user.id)
  #     end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  #   end    
  # end

  describe "with blank description" do
    before { @activity.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @activity.description = "a" * 201 }
    it { should_not be_valid }
  end

end



