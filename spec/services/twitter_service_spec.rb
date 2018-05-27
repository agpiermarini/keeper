require 'rails_helper'

describe TwitterService do
  let(:profile_params) { {"screen_name" => "turingschool"} }
  let(:profile_endpoint) { "/users/show.json"}
  it 'initializes with endpoint and username' do
    subject = TwitterService.new(profile_endpoint, profile_params)
    expect(subject).to be_a TwitterService
  end

  it 'can make an api call to a valid twitter user show endpoint' do
    VCR.use_cassette("twitter-service-user-show") do
      subject = TwitterService.new(profile_endpoint, profile_params)
      expect(subject.call_info).to have_key(:screen_name)
      expect(subject.call_info).to have_key(:name)
      expect(subject.call_info).to have_key(:location)
      expect(subject.call_info).to have_key(:description)
      expect(subject.call_info).to have_key(:followers_count)
      expect(subject.call_info).to have_key(:friends_count)
      expect(subject.call_info).to have_key(:statuses_count)
      expect(subject.call_info).to have_key(:status)
      expect(subject.call_info).to have_key(:profile_image_url)
    end
  end
end
