require 'rails_helper'

context 'User' do
  let(:user) { create(:user) }
  context 'can submit text from a non-Twitter source' do
    it 'creates a personality profile' do
      VCR.use_cassette('invalid_personality_profile_from_text') do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        name   = "Name"
        source = "Cover Letter"
        text   = Faker::Lorem.sentence(1)

        visit new_personality_profile_text_path

        fill_in :name, with: name
        fill_in :source, with: source
        fill_in :text, with: text
        click_on "Submit"

        expect(current_path).to eq('/personality-profile-text')

        expect(page).to have_content(name)
        expect(page).to have_content(source)
        within(".source") do
          expect(page).to have_content("N/A")
        end
        expect(page).to have_content("Unable to retrieve user profile. The number of words 3 is less than the minimum number of words required for analysis: 100.")

        expect(page).to_not have_content("Dimensions and Facets of Personality")
        expect(page).to_not have_content("Openness")
        expect(page).to_not have_content("Adventurousness")
        expect(page).to_not have_content("Emotionality")
        expect(page).to_not have_content("Intellect")
        expect(page).to_not have_content("Artistic interests")
        expect(page).to_not have_content("Imagination")
        expect(page).to_not have_content("Authority-challenging")

        expect(page).to_not have_content("Conscientiousnes")
        expect(page).to_not have_content("Achievement striving")
        expect(page).to_not have_content("Dutifulness")
        expect(page).to_not have_content("Self-discipline")
        expect(page).to_not have_content("Cautiousness")
        expect(page).to_not have_content("Orderliness")
        expect(page).to_not have_content("Self-efficacy")

        expect(page).to_not have_content("Extraversion")
        expect(page).to_not have_content("Activity level")
        expect(page).to_not have_content("Cheerfulness")
        expect(page).to_not have_content("Outgoing")
        expect(page).to_not have_content("Assertiveness")
        expect(page).to_not have_content("Excitement-seeking")
        expect(page).to_not have_content("Gregariousness")

        expect(page).to_not have_content("Agreeableness")
        expect(page).to_not have_content("Altruism")
        expect(page).to_not have_content("Modesty")
        expect(page).to_not have_content("Sympathy")
        expect(page).to_not have_content("Cooperation")
        expect(page).to_not have_content("Uncompromising")
        expect(page).to_not have_content("Trust")

        expect(page).to_not have_content("Emotional range")
        expect(page).to_not have_content("Fiery")
        expect(page).to_not have_content("Melancholy")
        expect(page).to_not have_content("Self-consciousness")
        expect(page).to_not have_content("Prone to_not worry")
        expect(page).to_not have_content("Immoderation")
        expect(page).to_not have_content("Susceptible to_not stress")

        expect(page).to_not have_content("Needs")

        expect(page).to_not have_content("Challenge")
        expect(page).to_not have_content("Excitement")
        expect(page).to_not have_content("Liberty")
        expect(page).to_not have_content("Self-expression")
        expect(page).to_not have_content("Closeness")
        expect(page).to_not have_content("Harmony")
        expect(page).to_not have_content("Love")
        expect(page).to_not have_content("Stability")
        expect(page).to_not have_content("Curiosity")
        expect(page).to_not have_content("Ideal")
        expect(page).to_not have_content("Practicality")
        expect(page).to_not have_content("Structure")

        expect(page).to_not have_content("Values")

        expect(page).to_not have_content("Conservation")
        expect(page).to_not have_content("Self-enhancement")
        expect(page).to_not have_content("Openness to_not change")
        expect(page).to_not have_content("Hedonism")
        expect(page).to_not have_content("Self-transcendence")
      end
    end
  end
end
