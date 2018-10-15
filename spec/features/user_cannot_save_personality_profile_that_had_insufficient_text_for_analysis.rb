require 'rails_helper'

context 'User' do
  let(:user) { create(:user) }
  context 'attempts to generate a personality profile with insufficient text' do
    it 'and does not have the option to save the profile' do
      VCR.use_cassette('invalid_personality_profile_from_text') do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        name   = 'Name'
        source = 'Cover Letter'
        text   = Faker::Lorem.sentence(1)

        visit new_personality_profile_text_path

        fill_in :name, with: name
        fill_in :source, with: source
        fill_in :text, with: text
        click_on 'Submit'

        expect(page).to_not have_content('Save Profile and Return to Dashboard')
      end
    end
  end
end
