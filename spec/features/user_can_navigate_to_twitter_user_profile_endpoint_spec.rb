require 'rails_helper'

context 'User' do
  context 'navigates to valid twitter user profile endpoint' do
    it 'and sees basic user information and button to retrieve personality insights profile' do
      VCR.use_cassette('twitter-profile-endpoint') do
        visit '/turingschool'

        expect(page).to have_content('@turingschool')
        expect(page).to have_content('Turing School')
        expect(page).to have_content('Denver, CO')
        expect(page).to have_content('We unlock human potential by training a diverse, inclusive student body to succeed in high-fulfillment technical careers.')
        expect(page).to have_content("RT @joshuajhun: Having my students white board some #react today. #lifeisgood #dev #js https://t.co/cHhHAnOYMD")

        within('.user-stat:nth-child(1)') do
          expect(page).to have_content("Total Tweets\n3,898")
        end

        within('.user-stat:nth-child(2)') do
          expect(page).to have_content("Followers\n2,758")
        end

        within('.user-stat:nth-child(3)') do
          expect(page).to have_content("Friends\n587")
        end

        within('.last-tweet') do
          expect(page).to have_content("RT @joshuajhun: Having my students white board some #react today. #lifeisgood #dev #js https://t.co/cHhHAnOYMD")
        end

        expect(page).to have_content("Generate Personality Profile")
        expect(page).to have_content("Search for a Different User")
      end
    end
  end
end
