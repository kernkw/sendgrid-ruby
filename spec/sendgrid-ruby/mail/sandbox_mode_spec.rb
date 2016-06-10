require 'spec_helper'

describe SendGrid::Mail::SandBoxMode do

  let(:enable) { rand(1..10).even? }
  let(:sandbox_mode) { SendGrid::Mail::SandBoxMode.new(enable: enable) }

  describe '.new' do
    it 'initializes correctly' do
      expect(sandbox_mode).to be_a SendGrid::Mail::SandBoxMode
    end
  end

  describe '#to_json' do
    it 'should display as proper json' do
      expected_json = {
        'enable' => enable
      }

      expect(sandbox_mode.to_json).to eq expected_json
    end
  end
end