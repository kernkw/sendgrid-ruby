require 'spec_helper'

describe SendGrid::Mail::MailSettings::BypassListManagement do
  let(:enable) { rand(1..1000).even? }
  let(:bypass_list_management) { SendGrid::Mail::MailSettings::BypassListManagement.new(enable: enable) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
         expect(bypass_list_management).to be_a SendGrid::Mail::MailSettings::BypassListManagement
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::MailSettings::BypassListManagement.new }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    it 'should display as proper json' do
      expect(bypass_list_management.to_json).to eq({ 'enable' => enable })
    end
  end
end