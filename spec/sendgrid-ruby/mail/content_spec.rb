require 'spec_helper'

describe SendGrid::Mail::Content do
  let(:type) { 'text/plain' }
  let(:value) { Faker::Lorem.paragraph }
  let(:content) { SendGrid::Mail::Content.new(type: type, value: value) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
        expect(content).to be_a SendGrid::Mail::Content
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::Content.new }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    context 'only required params' do
      it 'should display as proper json' do
        content.value = nil

        expect(content.to_json).to eq({ 'type' => type })
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        expect(content.to_json).to eq({ 'type' => type,'value' => value })
      end
    end
  end
end