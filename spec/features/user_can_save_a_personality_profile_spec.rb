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

        within('.list-results') do
          expect(page).to have_content("Username:\nturingschool")
          expect(page).to have_content("Name:\nTuring School")
          expect(page).to have_content("Generated on:\n#{Date.today.strftime('%B%e, %Y')}")
          expect(page).to have_button('Delete')
        end
      end
    end
  end
end
