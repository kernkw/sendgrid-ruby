require 'spec_helper'

describe SendGrid::Mail::BccSettings do
  let(:enable) { rand(1..1000).even? } # This may not be needed
  let(:email) { Faker::Internet.email }
  let(:name) { Faker::Name.name }
  let(:bcc_settings) { SendGrid::Mail::BccSettings.new(email: email) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
         expect(bcc_settings).to be_a SendGrid::Mail::BccSettings
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::BccSettings.new }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    context 'only required params' do
      it 'should display as proper json' do
        expect(bcc_settings.to_json).to eq({ 'email' => email })
      end
    end

    context 'all params' do
      it 'should remove blank values' do
        bcc_settings.name = name

        expected_json = { 'email' => email,
                          'name' => name }

        expect(bcc_settings.to_json).to eq expected_json
      end
    end
  end
end