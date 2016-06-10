require 'spec_helper'

describe SendGrid::Mail::MailSettings::Footer do
  let(:enable) { rand(1..100).even? }
  let(:text) { Faker::Lorem.paragraph }
  let(:html) { "<p> #{Faker::Lorem.paragraph} </p>" }
  let(:footer) { SendGrid::Mail::MailSettings::Footer.new(enable: enable, text: text, html: html) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
        expect(footer).to be_a SendGrid::Mail::MailSettings::Footer
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::MailSettings::Footer.new(text: text, html: html) }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    context 'only required params' do
      it 'should display as proper json' do
        footer.text = nil
        footer.html = nil

        expect(footer.to_json).to eq({ 'enable' => enable })
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        expect(footer.to_json).to eq({ 'enable' => enable,'text' => text, 'html' => html })
      end
    end
  end
end