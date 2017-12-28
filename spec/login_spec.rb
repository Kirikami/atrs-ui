require 'rspec'
require_relative '../pages/login_page'

describe 'On login page' do
  before :each do
    visit LoginPage
  end

  context 'sign in with valid credentials' do
    before do
      on(LoginPage).login :valid
    end
    it 'should display dashboard page' do
      expect(on(DashboardPage)).to have_logo
    end
  end

  describe 'sign in with invalid credentials' do

    context 'with empty email and password' do
      before do
        on(LoginPage).login :empty_creds
      end
      it 'I should see empty email and password error message' do
        expect(on(LoginPage)).to have_empty_credentials_error
      end
    end

    context 'with email without @' do
      before do
        on(LoginPage).login :no_at_email
      end
      it 'I should see email error message' do
        expect(on(LoginPage)).to have_email_error
      end
    end

    context 'with email without .' do
      before do
      on(LoginPage).login :no_dot_email
      end
      it 'I should see email error message' do
        expect(on(LoginPage)).to have_email_error
      end
    end

    context 'with short password' do
      before do
        on(LoginPage).login :short_password
      end
      it 'I should see password error message' do
        expect(on(LoginPage)).to have_password_error
      end
    end

    context 'with incorrect password' do
      before do
        on(LoginPage).login :incorrect_password
      end
      it 'I should see password error message' do
        expect(on(LoginPage)).to have_password_error
      end
    end

    context 'with long password' do
      before do
        on(LoginPage).login :long_password
      end
      it 'I should see password error message' do
        expect(on(LoginPage)).to have_password_error
      end
    end

  end
end