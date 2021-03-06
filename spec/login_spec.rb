require 'rspec'
require_relative '../pages/login_page'

describe 'On login page' do
  before :each do
    visit LoginPage
  end

  context 'sign in with valid credentials', :feature => 'Login', :severity => :normal do
    before do
      on(LoginPage).login(:valid)
    end
    it 'should display dashboard page', :testId => 1 do
      expect(on(DashboardPage)).to have_logo
    end
  end
end