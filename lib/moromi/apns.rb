require 'moromi/apns/config'
require 'moromi/apns/environment'
require 'moromi/apns/version'
require 'moromi/apns/parameter'
require 'moromi/apns/message'

module Moromi
  module Apns
    def self.configure(&block)
      yield @config ||= Config.new
    end

    def self.config
      @config
    end

    def self.environment(bundle_identifier)
      config.environment_builder_class.build(bundle_identifier)
    end

    configure do |config|
      config.environment_builder_class = ::Moromi::Apns::Environment::DefaultBuilder
    end
  end
end
