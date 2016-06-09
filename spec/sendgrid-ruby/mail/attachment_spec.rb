require 'spec_helper'

describe SendGrid::Mail::Attachment do
  let(:filename) { 'your_photo.png' }
  # TODO: update these to something thats relevant to what they actually are
  let(:content) { Faker::Hacker.say_something_smart }

  let(:attachment) { SendGrid::Mail::Attachment.new(content: content, filename: filename) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
        expect(attachment).to be_a SendGrid::Mail::Attachment
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::Attachment.new(content: content) }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    context 'only required params' do
      it 'should display as proper json' do
        expect(attachment.to_json).to eq({ 'content' => content,'filename' => filename })
      end
    end

    context 'all params' do
      it 'should remove blank values' do
        # TODO: update these to something thats relevant to what they actually are
        attachment.type = Faker::Hacker.abbreviation
        attachment.content_id = Faker::Hacker.noun
        attachment.disposition = Faker::Hacker.adjective

        expected_json = { 'content' => content,
                          'filename' => filename,
                          'type' =>  attachment.type,
                          'disposition' => attachment.disposition,
                          'content_id' => attachment.content_id }

        expect(attachment.to_json).to eq expected_json
      end
    end
  end
end