require 'spec_helper'

describe Moromi::Apns::Parameter do
  describe '::unserialize' do
    subject { Moromi::Apns::Parameter.unserialize(json) }

    context 'with json' do
      let(:parameter) { Moromi::Apns::Parameter.make_silent_push_parameter(custom_data: {hoge: 'fuga'}) }
      let(:json) { parameter.serialize }

      it { expect(subject).to eq parameter }
    end
  end
end
