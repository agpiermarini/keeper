require 'rails_helper'

context 'User' do
  context 'navigates to user endpoint of private account and clicks button to retrieve profile' do
    it 'and is directed to profile page with error message but no profile information' do
      VCR.use_cassette("personality-profile-endpoint-private-account") do
        visit '/lilwillifo'

        click_on 'Generate Personality Profile'

        expect(current_path).to eq("/lilwillifo/personality-profile")


        expect(page).to have_content("Unable to retrieve user profile. This user's account has been set to private. As such, we are unable to retrieve any tweets for analysis.")

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
        expect(page).to_not have_content("Prone to worry")
        expect(page).to_not have_content("Immoderation")
        expect(page).to_not have_content("Susceptible to stress")

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
        expect(page).to_not have_content("Openness to change")
        expect(page).to_not have_content("Hedonism")
        expect(page).to_not have_content("Self-transcendence")

        expect(page).to_not have_link('Save Profile and Return to Dashboard')
        expect(page).to have_link('Search for a Different User')
      end
    end
  end
end
