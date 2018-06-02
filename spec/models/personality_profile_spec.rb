require 'rails_helper'

describe PersonalityProfile do
  let(:data)     { stub_profile }
  subject { PersonalityProfile.new(data) }
  it 'initializes with username and personality profile data' do
    expect(subject).to be_a PersonalityProfile
  end

  describe 'instance methods' do
    describe '#personality' do
      it 'returns an array of personality characteristics' do
        expect(subject.dimensions).to be_a Array
        expect(subject.dimensions.count).to eq(5)

        expect(subject.dimensions.first).to be_a Dimension
        expect(subject.dimensions.first.name).to eq("Openness")
        expect(subject.dimensions.first.percentile).to eq(0.9300253602804942)

        expect(subject.dimensions.last).to be_a Dimension
        expect(subject.dimensions.last.name).to eq("Emotional range")
        expect(subject.dimensions.last.percentile).to eq(0.38240027823654515)
      end
    end

    describe '#needs' do
      it 'returns an array of consumer needs' do
        expect(subject.needs).to be_a Array
        expect(subject.needs.count).to eq(12)

        expect(subject.needs.first).to be_a Need
        expect(subject.needs.first.name).to eq("Challenge")
        expect(subject.needs.first.percentile).to eq(0.4491220062003746)

        expect(subject.needs.last).to be_a Need
        expect(subject.needs.last.name).to eq("Structure")
        expect(subject.needs.last.percentile).to eq(0.4835752076320925)
      end
    end

    describe '#values' do
      it 'returns an array of values' do
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
