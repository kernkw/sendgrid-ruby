require 'spec_helper'

describe SendGrid::Mail::CustomArg do
  let(:key) { Faker::Lorem.word }
  let(:value) { Faker::Lorem.word }
  let(:custom_arg) { SendGrid::Mail::CustomArg.new(key: key, value: value) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
        expect(custom_arg).to be_a SendGrid::Mail::CustomArg
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::CustomArg.new }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    it 'should display as proper json' do
      expect(custom_arg.to_json).to eq({ 'custom_arg' => { key => value } })
    end
  end
end