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
          # expect(page).to have_content("Generated on:\n#{Date.today.strftime('%B%e, %Y')}")
          expect(page).to have_button('Delete')
        end
      end
    end
  end

  context 'generates a personality profile, saves it once, and attempts to save a second time' do
    scenario 'but is unable to do so' do
      VCR.use_cassette('user-cannot-save-same-profile-twice') do
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
          # expect(page).to have_content("Generated on:\n#{Date.today.strftime('%B%e, %Y')}")
          expect(page).to have_button('Delete')
        end
        visit '/turingschool/personality-profile'
        click_on 'Save Profile and Return to Dashboard'

        expect(current_path).to eq('/dashboard')
        expect(page).to have_content("You have already saved this profile. You will be permitted to save new profiles for this user once they have been generated.")
      end
    end
  end

  context 'attempts to save a profile that someone else has already saved' do
    scenario 'and is able to do so' do
      VCR.use_cassette('user-can-save-profile-that-someone-else-has-saved') do
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
          # expect(page).to have_content("Generated on:\n#{Date.today.strftime('%B%e, %Y')}")
          expect(page).to have_button('Delete')
        end

        new_user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(new_user)

        visit '/turingschool/personality-profile'
        click_on 'Save Profile and Return to Dashboard'

        expect(current_path).to eq('/dashboard')
        expect(page).to have_content('Profile saved successfully')

        within('.list-results') do
          expect(page).to have_content("Username:\nturingschool")
          expect(page).to have_content("Name:\nTuring School")
          # expect(page).to have_content("Generated on:\n#{Date.today.strftime('%B%e, %Y')}")
          expect(page).to have_button('Delete')
        end
      end
    end
  end
end
