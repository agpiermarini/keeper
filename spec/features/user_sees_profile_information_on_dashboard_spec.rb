require 'rails_helper'

describe 'Logged-in user' do
  let(:user) { create(:user, username: "turingschool") }
  context 'visits dashboard' do
    scenario 'and sees avatar, description, location and name' do
      VCR.use_cassette('dashboard-view') do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        within('name') do
          expect(page).to have_content('Turing School')
        end

        within('login') do
          expect(page).to have_content('@turingschool')
        end

        within('location') do
          expect(page).to have_content('Denver, CO')
        end

        within('description') do
          expect(page).to have_content('We unlock human potential by training a diverse, inclusive student body to succeed in high-fulfillment technical careers.')
        end

        expect(page).to have_css('avatar')
      end
    end
  end
end
