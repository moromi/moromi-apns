require 'forwardable'

module Moromi::Apns::Message
  class Base
    extend Forwardable

    attr_reader :parameter

    def_delegators :@parameter, :alert, :badge, :sound, :content_available, :mutable_content, :category, :priority

    # @param [Moromi::Apns::Parameter] parameter
    def initialize(parameter:)
      @parameter = parameter
    end

    def type
      self.class.name
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

    # @param [Hash] params
    def self.unserialize(params)
      parameter = ::Moromi::Apns::Parameter.unserialize(params[:parameter])
      new(parameter: parameter)
    end
  end
end
