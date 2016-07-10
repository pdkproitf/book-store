require 'rails_helper'

describe 'User page' do

  subject { page }
  describe "user registration" do
    before { visit new_user_registration_path }
    #let(:submit) { "Sign up" }

    context "with valid information" do
      before do
        fill_in("Email", with: 'a12@email.com', :match => :prefer_exact)
        fill_in("Password", with: 'iloveyou', :match => :prefer_exact)
        fill_in("Password confirmation", with: 'iloveyou', :match => :prefer_exact)
      end

      it "ridirect the previous page" do
        click_button "Sign up"
        expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
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
