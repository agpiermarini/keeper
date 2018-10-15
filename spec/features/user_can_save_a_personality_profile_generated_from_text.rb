require 'rails_helper'

context 'User' do
  let(:user) { create(:user) }
  context 'can save a personality profile that they have generated from text' do
    it 'and see the personality profile on their dashboard' do
      VCR.use_cassette('personality_profile_from_text') do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        name   = 'Name'
        source = 'Cover Letter'
        text   = Faker::Lorem.sentence(1_500)

        visit new_personality_profile_text_path

        fill_in :name, with: name
        fill_in :source, with: source
        fill_in :text, with: text
        click_on 'Submit'

        click_on "Save Profile and Return to Dashboard"

        expect(current_path).to eq('/dashboard')
        expect(page).to have_content('Profile saved successfully')

        within('.list-results') do
          expect(page).to have_content(name)
          expect(page).to have_content(source)
          expect(page).to have_button('Delete')
        end
      end
    end
  end
end
