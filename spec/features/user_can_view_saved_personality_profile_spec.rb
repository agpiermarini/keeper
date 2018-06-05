require 'rails_helper'

context 'User' do
  context 'clicks on a saved personality profile while on the dashboard' do
    scenario 'and is directed to a page where they see appropriate profile information' do
      VCR.use_cassette('user-can-view-saved-profile') do
        user = create(:user, id: 1)
        profile = create(:personality_profile)
        create(:dimension); create(:facet); create(:need); create(:value)
        saved_profile = create(:saved_profile, user_id: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        click_on "#{profile.name}"

        expect(current_path).to eq("/saved-profiles/#{saved_profile.id}")

        expect(page).to have_content("#{profile.name}")
        expect(page).to have_content("#{profile.username}")

        expect(page).to have_content("Dimensions of Personality")
        expect(page).to have_content("#{profile.dimensions.first.name}")
        expect(page).to have_content("#{profile.dimensions.first.facets.first.name}")

        expect(page).to have_content("Needs")
        expect(page).to have_content("#{profile.needs.first.name}")

        expect(page).to have_content("Values")
        expect(page).to have_content("#{profile.values.first.name}")

        expect(page).to have_link('Return to Dashboard')
        expect(page).to have_link('Delete Profile and Return to Dashboard')
      end
    end
  end
end
