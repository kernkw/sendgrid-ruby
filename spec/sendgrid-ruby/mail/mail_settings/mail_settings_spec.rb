require 'spec_helper'

describe SendGrid::Mail::MailSettings::MailSettings do
  let(:mock_mail_object) do
    double().tap do|double|
      allow(double).to receive(:to_json).and_return( {'key' => 'value'} )
    end
  end

  let(:bcc) { mock_mail_object }
  let(:bypass_list_management) { mock_mail_object }
  let(:footer) { mock_mail_object }
  let(:sandbox_mode) { mock_mail_object }
  let(:spam_check) { mock_mail_object }

  let(:mail_settings) { SendGrid::Mail::MailSettings::MailSettings.new }

  describe '.new' do
    it 'initializes correctly' do
      expect(mail_settings).to be_a SendGrid::Mail::MailSettings::MailSettings
    end
  end

  describe '#to_json' do
    context 'with some params' do
      it 'should remove blank values' do
        mail_settings.bcc = bcc
        mail_settings.footer = footer

        expected_json = {
          'bcc' => bcc.to_json,
          'footer' => footer.to_json
        }

        expect(mail_settings.to_json).to eq expected_json
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        mail_settings.bcc = bcc
        mail_settings.footer = footer
        mail_settings.bypass_list_management = bypass_list_management
        mail_settings.sandbox_mode = sandbox_mode
        mail_settings.spam_check = spam_check

        expected_json = {
          'bcc' => bcc.to_json,
          'footer' => footer.to_json,
          'bypass_list_management' => bypass_list_management.to_json,
          'sandbox_mode' => sandbox_mode.to_json,
          'spam_check' => spam_check.to_json
        }

        expect(mail_settings.to_json).to eq expected_json
      end
    end
  end
end