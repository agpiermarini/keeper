require 'rails_helper'

context 'User' do
  context 'navigates to user endpoint and clicks button to retrieve profile' do
    it 'and is directed to profile page with profile information' do
      VCR.use_cassette("personality-profile-endpoint") do
        visit '/turingschool'

        click_on 'Generate Personality Profile'

        expect(current_path).to eq("/turingschool/personality-profile")

        expect(page).to have_css("big-five")
      end
    end
  end
end
