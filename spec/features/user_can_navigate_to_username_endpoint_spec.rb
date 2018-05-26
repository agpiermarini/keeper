require 'rails_helper'

context 'User' do
  context 'navigates to valid username endpoint' do
    skip 'and sees basic user information and button to retrieve personality insights profile' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/turingschool'

      expect(page).to have_content('turingschool')
      expect(page).to have_selector("input[type=submit][value='Retrieve Personality Insights']")

    end
  end
end
