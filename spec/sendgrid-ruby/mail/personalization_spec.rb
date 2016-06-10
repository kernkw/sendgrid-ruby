require 'spec_helper'

describe SendGrid::Mail::Personalization do

  let(:tos) { create_mock_recipients }
  let(:ccs) { create_mock_recipients }
  let(:bccs) { create_mock_recipients }
  let(:subject) { Faker::Hacker.say_something_smart }

  let(:headers) do
    Array.new.tap do |arr|
      2.times do
        arr << double().tap do |header|
          allow(header).to receive(:to_json).and_return({ Faker::Hacker.noun => Faker::Hacker.verb })
        end
      end
    end
  end

  let(:send_at) { Faker::Time.forward(23, :morning).to_i }

  let(:personalization) { SendGrid::Mail::Personalization.new(tos: tos ) }

  describe '.new' do
    it 'initializes correctly' do
      binding.pry
      expect(personalization).to be_a SendGrid::Mail::Personalization
    end
  end


  def create_mock_recipients
    Array.new.tap do |arr|
      3.times do
        arr << double().tap do |to|
          allow(to).to receive(:to_json).and_return( {'name' => Faker::Name.name,
                                                    'email' => Faker::Internet.email } )
        end
      end
    end
  end
end