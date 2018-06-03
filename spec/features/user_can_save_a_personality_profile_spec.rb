require 'rails_helper'

context 'User' do
  context 'generates a personality profile and clicks save' do
    scenario 'and sees the saved profile on their dashboard' do
      VCR.use_cassette('user-can-save-profile') do
        visit '/'
        click_on 'Login with Twitter'
        visit '/turingschool/personality-profile'
        click_on 'Save Profile and Return to Dashboard'

        expect(current_path).to eq('/dashboard')
        expect(page).to have_content('Profile saved successfully')
        expect(page).to have_content('Saved Personality Profiles:')

        within('.saved-profiles') do
          # expect(page).to have_content('TuringSchool')
          expect(page).to have_content('turingschool')
        end
      end
    end
  end
end
