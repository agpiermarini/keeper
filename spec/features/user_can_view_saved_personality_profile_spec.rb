require 'rails_helper'

context 'User' do
  context 'clicks on a saved personality profile while on the dashboard' do
    scenario 'and is directed to a page where they see appropriate profile information' do
      VCR.use_cassette('user-can-view-saved-profile') do
        user = create(:user, id: 1)
        profile = create(:personality_profile)
        create(:dimension); create(:facet); create(:need); create(:value)
        saved_profile = create(:saved_profile)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        click_on "#{profile.name}"

        expect(current_path).to eq("/saved-profiles/#{saved_profile.id}")

        expect(page).to have_content("#{profile.name}")
        expect(page).to have_content("#{profile.username}")
        expect(page).to have_content("#{profile.location}")

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

        expect(page).to have_link('Return to Dashboard')
        expect(page).to have_link('Delete Profile and Return to Dashboard')
      end
    end
  end
end
