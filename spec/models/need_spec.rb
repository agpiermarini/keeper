require 'rails_helper'

describe Need, type: :model do
  it {should belong_to :personality_profile}
end
