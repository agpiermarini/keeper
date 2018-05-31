require 'rails_helper'

context 'User' do
  scenario 'can login with Twitter credentials' do
    VCR.use_cassette('user-logout') do
      visit '/'

      click_on "Login with Twitter"

      expect(page.status_code).to eq(200)

      expect(current_path).to eq("/dashboard")
    end
  end
end
