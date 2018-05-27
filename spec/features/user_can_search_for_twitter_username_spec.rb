require 'rails_helper'

context 'User' do
  context 'searches for a valid twitter username' do
    skip 'and is directed to a page basic information on that user' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/search'

      username = "turingschool"

      fill_in "username", with: username
      click_on "Submit"

      expect(current_path).to eq("/#{username}")
      expect(page).to have_content(username)
    end
  end
end
