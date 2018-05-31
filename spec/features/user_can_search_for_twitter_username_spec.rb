require 'rails_helper'

context 'User' do
  context 'searches for a valid twitter username' do
    it 'and sees a list of potential users matching that username' do
      visit '/search'

      fill_in "username_query", with: 'turingschool'
      click_on "Submit Search"

      expect(current_path).to eq('/search')

      click_on 'turingschool'

      expect(current_path).to eq("/#{username}")
    end
  end
end
