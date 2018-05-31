require 'rails_helper'

describe 'Logged-in user' do
  context 'visits dashboard' do
    scenario 'and sees avatar, description, location and name' do
      VCR.use_cassette('dashboard-view') do
        visit '/'

        click_on "Login with Twitter"

        expect(current_path).to eq('/dashboard')

        within('.name') do
          expect(page).to have_content('↟Aɴᴅʀeᴡ')
        end

        within('.login') do
          expect(page).to have_content('@agpiermarini')
        end

        within('.location') do
          expect(page).to have_content('')
        end

        within('.description') do
          expect(page).to have_content('🍃')
        end

        expect(page).to have_css('.avatar')
      end
    end
  end
end
