require 'spec_helper'

describe SendGrid::Mail::SubscriptionTracking do
  let(:enable) { rand(1..100).even? }
  let(:text) { Faker::Lorem.sentence }
  let(:html) { Faker::Lorem.sentence }
  let(:substitution_tag) { '[tag]' }

  let(:subscription_tracking) do
    SendGrid::Mail::SubscriptionTracking.new(enable: enable, text: text, html: html, substitution_tag: substitution_tag )
  end

  describe '.new' do
    it 'initializes correctly' do
      expect(subscription_tracking).to be_a SendGrid::Mail::SubscriptionTracking
    end
  end

  describe '#to_json' do
    context 'with some params' do
      it 'should display as proper json' do
        subscription_tracking.html = nil
        subscription_tracking.substitution_tag = nil

        expected_json = {
          'enable' => enable,
          'text' => text
        }

        expect(subscription_tracking.to_json).to eq expected_json
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        expected_json = {
          'enable' => enable,
          'text' => text,
          'html' => html,
          'substitution_tag' => substitution_tag
        }

        expect(subscription_tracking.to_json).to eq expected_json
      end
    end
  end
end