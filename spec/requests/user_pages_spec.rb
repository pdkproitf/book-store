require 'rails_helper'

describe 'User page' do

  describe "user registration" do
    before { visit new_user_registration_path }
    let(:submt) { "Sign up" }

    context "with valid information" do
      before do
        fill_in "Email",                 :with => "thangphuc@example.com"
        fill_in "Password",              :with => "ilovegrapes"
        fill_in "Password confirmation", :with => "ilovegrapes"

        click_button "Sign up"
      end
      it "allows new users to register with an email address and password" do


        expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
      end
    context "with invalid information" do
    end

    end
  end

  describe 'sign_in page' do

  end

  describe 'forgot_password page' do

  end
end
