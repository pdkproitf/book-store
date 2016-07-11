require 'rails_helper'


describe 'User page' do

  subject { page }

  describe "signup" do
    before { visit '/users/sign_up' }
    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      it "error if email exist" do
        within 'ul li' do
          expect(page).to have_content('2 errors prohibited this user from being saved:')
        end
      end
    end

    describe "with valid information" do
      before do
        fill_in("Email", with: 'aaaa12@gmail.com', :match => :prefer_exact)
        fill_in("Password", with: 'iloveyou', :match => :prefer_exact)
        fill_in("Password confirmation", with: 'iloveyou', :match => :prefer_exact)
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      it "show notice after sign up" do
        click_button submit
        expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
      end
    end
  end

  describe 'sign_in page' do

  end

  describe 'forgot_password page' do

  end
end
