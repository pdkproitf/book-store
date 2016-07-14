require 'rails_helper'

describe 'Authentication' do
  describe 'signin page' do

    subject { page }
    before { visit new_user_session_path }
    let(:submit) { "Log in" }
    let(:user) { FactoryGirl.build(:user, email: 'kiemsong34@gmail.com') }

    it { expect(page).to have_selector('h2', text: 'Log in') }

    describe 'with invalid information' do
      before { click_button submit }

      it { expect(page).to have_link('Login', href: new_user_session_path) }
      it { expect(page).to have_selector('div.alert.alert-danger', text: 'Invalid Email or password.') }
    end

    describe 'with valid information' do
      before do
        fill_in "user_email", with: 'kiemsong34@gmail.com'
        fill_in "user_password", with: '123456'
        click_button submit
      end
      it { expect(page).to have_selector('div.alert.alert-success', text: 'Signed in successfully.') }
      it { expect(page).to have_link('Logout', href: destroy_user_session_path) }
      it { expect(page).not_to have_link('Login', href: new_user_session_path) }
    end
  end

end
