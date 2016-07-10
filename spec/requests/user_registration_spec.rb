require 'rails_helper';

describe 'User registration' do
  let(:user_email) { 'registration_test_user@example.org' }
  let(:user_password) { 'registration_test_password' }

  before :each do
    visit new_user_registration_path

    fill_in('user_email', with: user_email, :match => :prefer_exact)
    fill_in('user_password', with: user_password, :match => :prefer_exact)
    fill_in('user_password_confirmation', with: user_password, :match => :prefer_exact)

    click_button 'Sign up'
  end

  it "shows message about confirmation email" do
    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please open the link to activate your account.")
  end

  describe "confirmation email" do
    # Include email_spec modules here, not in rails_helper because they
    # conflict with the capybara-email#open_email method which lets us
    # call current_email.click_link below.
    # Re: https://github.com/dockyard/capybara-email/issues/34#issuecomment-49528389
    include EmailSpec::Helpers
    include EmailSpec::Matchers

    # open the most recent email sent to user_email
    subject { open_email(user_email) }

    # Verify email details
    it { is_expected.to deliver_to(user_email) }
    it { is_expected.to have_body_text(/You can confirm your account/) }
    it { is_expected.to have_body_text(/users\/confirmation\?confirmation/) }
    it { is_expected.to have_subject(/Confirmation instructions/) }
  end

  context "when clicking confirmation link in email" do
    before :each do
      open_email(user_email)
      current_email.click_link 'Confirm my account'
    end

    it "shows confirmation message" do
      expect(page).to have_content('Your account was successfully confirmed')
    end

    it "confirms user" do
      user = User.find_for_authentication(email: user_email)
      expect(user).to be_confirmed
    end
  end
end
