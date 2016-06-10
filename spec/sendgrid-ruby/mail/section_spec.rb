require 'spec_helper'

describe SendGrid::Mail::Section do

  let(:key) { Faker::Hacker.noun }
  let(:value) { Faker::Hacker.verb }

  let(:section) { SendGrid::Mail::Section.new(key: key, value: value) }

  describe '.new' do
    it 'initializes correctly' do
      expect(section).to be_a SendGrid::Mail::Section
    end
  end

  describe '#to_json' do
    it 'should display as proper json' do
      expected_json = {
        'section' => { key => value }
      }

      expect(section.to_json).to eq expected_json
    end
  end
end