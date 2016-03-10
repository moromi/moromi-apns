require 'spec_helper'

describe Moromi::Apns::Environment::DefaultBuilder do
  describe '::build' do
    subject { Moromi::Apns::Environment::DefaultBuilder.build(identifier) }

    let(:debug_identifier) { 'com.example.moromi.apns.debug' }
    let(:in_house_identifier) { 'com.example.moromi.apns.in_house' }
    let(:production_identifier) { 'com.example.moromi.apns.production' }

    before do
      Moromi::Apns.configure do |config|
        config.identifiers = {
          debug: debug_identifier,
          in_house: in_house_identifier,
          production: production_identifier,
        }
      end
    end

    context 'with debug identifier' do
      let(:identifier) { debug_identifier }
      it { expect(subject).to be_instance_of Moromi::Apns::Environment::Debug }
    end

    context 'with in_house identifier' do
      let(:identifier) { in_house_identifier }
      it { expect(subject).to be_instance_of Moromi::Apns::Environment::InHouse }
    end

    context 'with production identifier' do
      let(:identifier) { production_identifier }
      it { expect(subject).to be_instance_of Moromi::Apns::Environment::Production }
    end

    context 'with invalid identifier' do
      let(:identifier) { 'dummy' }
      it { expect { subject }.to raise_error Moromi::Apns::Environment::InvalidEnvironment }
    end
  end
end
