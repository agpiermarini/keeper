require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :uid}
    # it {should validate_uniqueness_of :uid}
    it {should validate_presence_of :username}
    it {should validate_presence_of :avatar_url}
    it {should validate_presence_of :oauth_token}
    it {should validate_presence_of :oauth_secret}
  end
end
