require 'rails_helper'

describe 'User registration' do
  describe 'Sign up page' do

    subject { page }
    before { visit '/users/sign_up' }
    let(:submit) { "Sign up" }
    let(:user) { FactoryGirl.build(:user) }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      it "return Sign up Page" do
        click_button submit
        within 'h2' do
          expect(page).to have_content('Sign up')
        end
      end
    end

    describe "with valid information" do
      before do
        visit new_user_registration_path

        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password
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
end

