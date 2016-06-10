require 'spec_helper'

describe SendGrid::Mail::TrackingSettings::OpenTracking do
  let(:enable) { rand(1..100).even? }
  let(:substitution_tag) { "%" + Faker::Name.name }
  let(:open_tracking) { SendGrid::Mail::TrackingSettings::OpenTracking.new(enable: enable, substitution_tag: substitution_tag) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
        expect(open_tracking).to be_a SendGrid::Mail::TrackingSettings::OpenTracking
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::TrackingSettings::OpenTracking.new }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    context 'only required params' do
      it 'should display as proper json' do
        open_tracking.substitution_tag = nil

        expect(open_tracking.to_json).to eq({ 'enable' => enable })
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        expect(open_tracking.to_json).to eq({ 'enable' => enable,'substitution_tag' => substitution_tag })
      end
    end
  end
end