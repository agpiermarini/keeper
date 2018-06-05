require 'rails_helper'

context 'User' do
  context 'navigates to user endpoint of account with fewer tweets than are necessary for statistical significance clicks button to retrieve profile' do
    it 'and is directed to profile page with warning message and profile information' do
      VCR.use_cassette("personality-profile-endpoint-insufficient-tweets") do
        visit '/wraithcube'

        click_on 'Generate Personality Profile'

        expect(current_path).to eq("/wraithcube/personality-profile")

        expect(page).to have_content("There were 104 words in the input. We need a minimum of 600, preferably 1,200 or more, to compute statistically significant estimates.")

        expect(page).to have_content("Dimensions of Personality")
        expect(page).to have_content("Openness")
        expect(page).to have_content("Adventurousness")
        expect(page).to have_content("Emotionality")
        expect(page).to have_content("Intellect")
        expect(page).to have_content("Artistic interests")
        expect(page).to have_content("Imagination")
        expect(page).to have_content("Authority-challenging")

        expect(page).to have_content("Conscientiousnes")
        expect(page).to have_content("Achievement striving")
        expect(page).to have_content("Dutifulness")
        expect(page).to have_content("Self-discipline")
        expect(page).to have_content("Cautiousness")
        expect(page).to have_content("Orderliness")
        expect(page).to have_content("Self-efficacy")

        expect(page).to have_content("Extraversion")
        expect(page).to have_content("Activity level")
        expect(page).to have_content("Cheerfulness")
        expect(page).to have_content("Outgoing")
        expect(page).to have_content("Assertiveness")
        expect(page).to have_content("Excitement-seeking")
        expect(page).to have_content("Gregariousness")

        expect(page).to have_content("Agreeableness")
        expect(page).to have_content("Altruism")
        expect(page).to have_content("Modesty")
        expect(page).to have_content("Sympathy")
        expect(page).to have_content("Cooperation")
        expect(page).to have_content("Uncompromising")
        expect(page).to have_content("Trust")

        expect(page).to have_content("Emotional range")
        expect(page).to have_content("Fiery")
        expect(page).to have_content("Melancholy")
        expect(page).to have_content("Self-consciousness")
        expect(page).to have_content("Prone to worry")
        expect(page).to have_content("Immoderation")
        expect(page).to have_content("Susceptible to stress")

        expect(page).to have_content("Needs")

        expect(page).to have_content("Challenge")
        expect(page).to have_content("Excitement")
        expect(page).to have_content("Liberty")
        expect(page).to have_content("Self-expression")
        expect(page).to have_content("Closeness")
        expect(page).to have_content("Harmony")
        expect(page).to have_content("Love")
        expect(page).to have_content("Stability")
        expect(page).to have_content("Curiosity")
        expect(page).to have_content("Ideal")
        expect(page).to have_content("Practicality")
        expect(page).to have_content("Structure")

        expect(page).to have_content("Values")

        expect(page).to have_content("Conservation")
        expect(page).to have_content("Self-enhancement")
        expect(page).to have_content("Openness to change")
        expect(page).to have_content("Hedonism")
        expect(page).to have_content("Self-transcendence")

        expect(page).to have_link('Save Profile and Return to Dashboard')
        expect(page).to have_link('Search for a Different User')
      end
    end
  end
end
