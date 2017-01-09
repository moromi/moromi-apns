require 'forwardable'

module Moromi::Apns::Message
  class Base
    extend Forwardable

    attr_reader :parameter

    def_delegators :@parameter, :alert, :badge, :sound, :content_available, :mutable_content, :category, :priority

    # @param [Moromi::Apns::Parameter] parameter
    def initialize(parameter:, type: nil)
      @parameter = parameter
      @type = type
    end

    def type
      type || self.class.name
    end

    def custom_data
      {type: type}.merge(@parameter.custom_data)
    end

    def serialize
      {
        type: type,
        parameter: @parameter.serialize
      }
    end

    def to_hash
      base = {
        aps: {
          badge: badge,
          alert: alert,
          sound: sound,
          'content-available' => content_available,
          'mutable-content' => mutable_content,
          priority: priority
        }
      }
      custom_data.merge(base)
    end

    # @param [Hash] params
    def self.unserialize(params)
      parameter = ::Moromi::Apns::Parameter.unserialize(params[:parameter])
      new(parameter: parameter, type: params[:type])
    end
  end
end
