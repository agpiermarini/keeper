require 'rails_helper'

context 'User' do
  context 'searches for a valid twitter username' do
    let(:user) { create(:user) }
    it 'and sees a list of potential users matching that username' do
      VCR.use_cassette('search-endpoint') do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/search'

        fill_in "username_query", with: 'turingschool'
        click_on "Search"

        expect(current_path).to eq('/search')

        click_on 'turingschool'

        expect(current_path).to eq("/turingschool")
      end
    end
  end
end
