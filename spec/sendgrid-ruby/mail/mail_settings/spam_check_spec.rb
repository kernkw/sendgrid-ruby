require 'spec_helper'

describe SendGrid::Mail::MailSettings::SpamCheck do
  let(:enable) { rand(1..100).even? }
  let(:threshold) { rand(1..10) }
  let(:post_to_url) { Faker::Internet.url }

  let(:spam_check) do
    SendGrid::Mail::MailSettings::SpamCheck.new(enable: enable, threshold: threshold, post_to_url: post_to_url)
  end


  describe '.new' do
    it 'initializes correctly' do
      expect(spam_check).to be_a SendGrid::Mail::MailSettings::SpamCheck
    end
  end

 describe '#to_json' do
    context 'with some params' do
      it 'should display as proper json' do
        spam_check.threshold = nil

        expected_json = {
          'enable' => enable,
          'post_to_url' => post_to_url
        }

        expect(spam_check.to_json).to eq expected_json
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        expected_json = {
          'enable' => enable,
          'threshold' => threshold,
          'post_to_url' => post_to_url
        }

        expect(spam_check.to_json).to eq expected_json
      end
    end
  end
end