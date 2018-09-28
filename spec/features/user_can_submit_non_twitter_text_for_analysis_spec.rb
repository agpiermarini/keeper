require 'rails_helper'

context 'User' do
  scenario 'can submit text from a non-Twitter source' do
    let(:user) { create(:user) }
    it 'creates a personality profile' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      name   = "Name"
      source = "Cover Letter"
      text   = Faker::Lorem.sentence(1_500)

      visit search_path

      click_on 'Submit Text from a Non-Twitter Source'

      expect(current_path).to be(text_input_path)

      fill_in :name, with: name
      fill_in :source, with: source
      fill_in :text, with: text
      click_on "Submit"

      expect(current_path).to be('/name/personalit-profile')
    end
  end
end
