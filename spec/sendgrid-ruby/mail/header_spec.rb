require 'spec_helper'

describe SendGrid::Mail::Header do
  let(:key) { Faker::Lorem.word }
  let(:value) { Faker::Lorem.word }
  let(:header) { SendGrid::Mail::Header.new(key: key, value: value) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
        expect(header).to be_a SendGrid::Mail::Header
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::Header.new }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    it 'should display as proper json' do
      expect(header.to_json).to eq({ 'header' => { key => value } })
    end
  end
end