require 'spec_helper'

describe SendGrid::Mail::Categories do
  let(:category) { Faker.name }
  let(:categories) { SendGrid::Mail::Categories.new(categories: [category]) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
         expect(categories).to be_a SendGrid::Mail::Categories
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::Categories.new }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    it 'should display as proper json' do
      expect(categories.to_json).to eq({ 'categories' => [category] })
    end
  end
end