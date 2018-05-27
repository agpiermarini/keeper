require 'rails_helper'

context 'User' do
  scenario 'can login with Twitter credentials' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    click_on "Login with Twitter"

    expect(page.status_code).to eq(200)

    expect(current_path).to eq("/dashboard")
  end
end
