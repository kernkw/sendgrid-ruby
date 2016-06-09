require 'spec_helper'

describe SendGrid::Mail::ClickTracking do
  let(:enable) { rand(1..100).even? }
  let(:enable_text) { rand(1..100).even? }
  let(:click_tracking) { SendGrid::Mail::ClickTracking.new(enable: enable, enable_text: enable_text) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
        expect(click_tracking).to be_a SendGrid::Mail::ClickTracking
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::ClickTracking.new }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    context 'only required params' do
      it 'should display as proper json' do
        click_tracking.enable_text = nil

        expect(click_tracking.to_json).to eq({ 'enable' => enable })
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        expect(click_tracking.to_json).to eq({ 'enable' => enable,'enable_text' => enable_text })
      end
    end
  end
end