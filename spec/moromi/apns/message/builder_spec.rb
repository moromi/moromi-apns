require 'spec_helper'

describe Moromi::Apns::Message::Builder do
  describe '::build' do
    subject { Moromi::Apns::Message::Builder.build(json) }

    let(:json) {}

    context 'with serialized object that subclass of Moromi::Apns::Message::Base' do
      let(:item) { Moromi::Apns::Message::Announce.make(message: 'message') }
      let(:json) { item.serialize }

      it { expect(subject).to be_instance_of Moromi::Apns::Message::Announce }
      it { expect(subject.parameter).to eq item.parameter }
    end
  end
end
