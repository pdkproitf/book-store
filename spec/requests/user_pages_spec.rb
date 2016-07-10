require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'User page' do

  subject { page }
  describe "user registration" do
    before { visit new_user_registration_path }
    #let(:submit) { "Sign up" }



      it "ridirect the previous page" do
        fill_in("Email", with: 'aaaa12@gmail.com', :match => :prefer_exact)
        fill_in("Password", with: 'iloveyou', :match => :prefer_exact)
        fill_in("Password confirmation", with: 'iloveyou', :match => :prefer_exact)
        click_button "Sign up"
        expect(page).to have_selector("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
    end


  end

  describe 'sign_in page' do

  end

  describe 'forgot_password page' do

  end
end
