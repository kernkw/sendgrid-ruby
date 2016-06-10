require 'spec_helper'

describe SendGrid::Mail::TrackingSettings do
  let(:mock_tracking_object) do
    double().tap do|double|
      allow(double).to receive(:to_json).and_return( {'key' => 'value'} )
    end
  end

  let(:click_tracking) { mock_tracking_object }
  let(:open_tracking) { mock_tracking_object }
  let(:subscription_tracking) { mock_tracking_object }
  let(:ganalytics) { mock_tracking_object }

  let(:tracking_settings) { SendGrid::Mail::TrackingSettings.new(click_tracking: click_tracking, open_tracking: open_tracking) }

  describe '.new' do
    it 'initializes correctly' do
      expect(tracking_settings).to be_a SendGrid::Mail::TrackingSettings
    end
  end

  describe '#to_json' do
    context 'with some params' do
      it 'should display as proper json' do
        expected_json = {
          'click_tracking' => click_tracking.to_json,
          'open_tracking' => open_tracking.to_json
        }

        expect(tracking_settings.to_json).to eq expected_json
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        tracking_settings.subscription_tracking = subscription_tracking
        tracking_settings.ganalytics = ganalytics

        expected_json = {
          'click_tracking' => click_tracking.to_json,
          'open_tracking' => open_tracking.to_json,
          'subscription_tracking' => subscription_tracking.to_json,
          'ganalytics' => ganalytics.to_json
        }

        expect(tracking_settings.to_json).to eq expected_json
      end
    end
  end

end