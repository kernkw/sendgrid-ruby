require 'spec_helper'

describe SendGrid::Mail::Substitution do
  let(:key) { 'name' }
  let(:value) { Faker::Name.name }
  let(:substitution) { SendGrid::Mail::Substitution.new(key: key, value: value) }


  describe '.new' do
    it 'initializes correctly' do
      expect(substitution).to be_a SendGrid::Mail::Substitution
    end
  end


  describe '#to_json' do
    it 'should return expected json' do
      expected_json = { 'substitution' => { key => value } }

      expect(substitution.to_json).to eq expected_json
    end
  end
end
