require 'active_support/configurable'

module Moromi
  module Apns
    class Config
      include ActiveSupport::Configurable

      config_accessor :identifiers
      config_accessor :environment_builder_class
    end
  end
end
