require 'rails_helper'

describe PersonalityInsightsProfile do
  let(:data)     { stub_profile }
  subject { PersonalityInsightsProfile.new(data) }
  it 'initializes with username and personality profile data' do
    expect(subject).to be_a PersonalityInsightsProfile
  end

  describe 'instance methods' do
    describe '#personality' do
      it 'returns an array of personality characteristics' do
        expect(subject.personality).to be_a Array
        expect(subject.personality.count).to eq(5)

        expect(subject.personality.first).to be_a Dimension
        expect(subject.personality.first.name).to eq("Openness")
        expect(subject.personality.first.percentile).to eq(0.9300253602804942)

        expect(subject.personality.last).to be_a Dimension
        expect(subject.personality.last.name).to eq("Emotional range")
        expect(subject.personality.last.percentile).to eq(0.38240027823654515)
      end
    end

    describe '#values' do
      it 'returns an array of personality characteristics' do
        expect(subject.values).to be_a Array
        expect(subject.values.count).to eq(5)

        expect(subject.values.first).to be_a Value
        expect(subject.values.first.name).to eq("Conservation")
        expect(subject.values.first.percentile).to eq(0.1400296207252021)

        expect(subject.values.last).to be_a Value
        expect(subject.values.last.name).to eq("Self-transcendence")
        expect(subject.values.last.percentile).to eq(0.03310830781717733)
      end
    end
  end
end
