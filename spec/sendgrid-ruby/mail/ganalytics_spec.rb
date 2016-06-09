require 'spec_helper'

describe SendGrid::Mail::Ganalytics do
  let(:enable) { rand(1..100).even? }
  let(:utm_source) { Faker::Lorem.word }
  let(:utm_medium) { Faker::Lorem.word }
  let(:utm_term) { Faker::Lorem.word }
  let(:utm_content) { Faker::Lorem.word }
  let(:utm_campaign) { Faker::Lorem.word }

  let(:ganalytics) { SendGrid::Mail::Ganalytics.new(enable: enable,
                                                    utm_source: utm_source,
                                                    utm_medium: utm_medium,
                                                    utm_term: utm_term,
                                                    utm_content: utm_content,
                                                    utm_campaign: utm_campaign) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
        expect(ganalytics).to be_a SendGrid::Mail::Ganalytics
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::Ganalytics.new(utm_source: utm_source,
                                               utm_medium: utm_medium,
                                               utm_term: utm_term,
                                               utm_content: utm_content,
                                               utm_campaign: utm_campaign) }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    context 'only required params' do
      it 'should display as proper json' do
        ganalytics.utm_source = nil
        ganalytics.utm_medium = nil
        ganalytics.utm_term = nil
        ganalytics.utm_content = nil
        ganalytics.utm_campaign = nil

        expect(ganalytics.to_json).to eq({ 'enable' => enable })
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        expect(ganalytics.to_json).to eq({ 'enable' => enable,
                                           'utm_source' => utm_source,
                                           'utm_medium' => utm_medium,
                                           'utm_term' => utm_term,
                                           'utm_content' => utm_content,
                                           'utm_campaign' => utm_campaign})
      end
    end
  end
end