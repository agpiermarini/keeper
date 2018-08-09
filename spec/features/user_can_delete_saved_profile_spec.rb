require 'rails_helper'

describe 'User' do
  describe 'can click delete button on saved profile on dashboard' do
    it ' and it successfully removes the profile from saved profiles list' do
      VCR.use_cassette('delete-saved-profile-feature-dashboard') do
        user = create(:user, id: 1)
        profile = create(:personality_profile)
        create(:dimension); create(:facet); create(:need); create(:value)
        saved_profile = create(:saved_profile)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        expect(page).to have_content("Name:\n#{profile.name}")
        expect(page).to have_content("Username:\n#{profile.username}")
        expect(page).to have_content("\nGenerated on:\n#{Date.parse(profile.created_at.to_s).strftime('%B%e, %Y')}")

        user.reload

        click_on "Delete"

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Profile deleted successfully")
        expect(page).to_not have_content("Name:\n#{profile.name}")
        expect(page).to_not have_content("Username:\n#{profile.username}")
        expect(page).to_not have_content("\nGenerated on:\n#{Date.parse(profile.created_at.to_s).strftime('%B%e, %Y')}")
      end
    end
  end

  describe 'can click delete button on saved profile page' do
    it ' and it successfully removes the profile from saved profiles list' do
      VCR.use_cassette('delete-saved-profile-feature-show-page') do
        user = create(:user, id: 1)
        profile = create(:personality_profile)
        create(:dimension); create(:facet); create(:need); create(:value)
        saved_profile = create(:saved_profile)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit "/saved-profiles/#{saved_profile.id}"

        # user.reload

        click_on "Delete Profile and Return to Dashboard"

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Profile deleted successfully")
        expect(page).to_not have_content("Name:\n#{profile.name}")
        expect(page).to_not have_content("Username:\n#{profile.username}")
        expect(page).to_not have_content("\nGenerated on:\n#{Date.parse(profile.created_at.to_s).strftime('%B%e, %Y')}")
      end
    end
  end
end
