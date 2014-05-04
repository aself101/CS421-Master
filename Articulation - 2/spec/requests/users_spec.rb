require 'spec_helper'

describe "Users" do
  subject { user }
  describe "GET /users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      let(:user) { FactoryGirl.create(:user) }
      get users_path
      #response.status.should be(200)
      before { visit user_path }

      let(:submit) { "Create my account" }

      describe "with invalid information" do
        it "should not create a user" do
          expect { click_button submit }.not_to change(User, :count)
        end
      end
      it { should respond_to(:password_confirmation) }
      it { should respond_to(:remember_token) }
      it { should respond_to(:authenticate) }
      describe "with valid information" do
        before do
          fill_in "Name",         with: "Example User"
          fill_in "Email",        with: "user@example.com"
          fill_in "Password",     with: "foobar"
          fill_in "Confirmation", with: "foobar"
        end

        it "should create a user" do
          expect { click_button submit }.to change(User, :count).by(1)
        end
    end
  end
  end
end
