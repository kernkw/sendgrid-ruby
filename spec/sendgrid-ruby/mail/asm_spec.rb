require 'spec_helper'

describe SendGrid::Mail::ASM do
  let(:group_id) { rand(1..100) }
  let(:groups_to_display) { (0..5).map { rand(1..10) }  }
  let(:asm) { SendGrid::Mail::ASM.new(group_id: group_id, groups_to_display: groups_to_display) }

  describe '.new' do
    context 'required params included' do
      it 'initializes correctly' do
        expect(asm).to be_a SendGrid::Mail::ASM
      end
    end

    context 'required params not included' do
      it 'raises argument error' do
        expect{ SendGrid::Mail::ASM.new(groups_to_display: groups_to_display) }.to raise_error ArgumentError
      end
    end
  end

  describe 'to_json' do
    context 'only required params' do
      it 'should display as proper json' do
        asm.groups_to_display = nil

        expect(asm.to_json).to eq({ 'group_id' => group_id })
      end
    end

    context 'with all params' do
      it 'should remove blank values' do
        expect(asm.to_json).to eq({ 'group_id' => group_id,'groups_to_display' => groups_to_display })
      end
    end
  end
end