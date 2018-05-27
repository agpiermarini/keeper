require 'rails_helper'

context 'User' do
  scenario 'can log out of application' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    click_on "Login with Twitter"

    expect(page.status_code).to be(200)
    expect(current_path).to eq('/dashboard')

    click_on "Logout"

    expect(page.status_code).to be(200)
    expect(current_path).to eq('/')
    expect(page).to have_content("Login with Twitter")
    expect(page).to_not have_content("Logout")
  end
end
