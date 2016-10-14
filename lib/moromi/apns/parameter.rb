require 'json'
require 'active_support/core_ext/hash'

module Moromi
  module Apns
    class Parameter
      attr_reader :alert
      attr_reader :badge
      attr_reader :sound
      attr_reader :content_available
      attr_reader :category
      attr_reader :priority
      attr_reader :custom_data

      def initialize(alert:, badge:, sound: 'default', content_available: 1, category: nil, priority: 10, custom_data: {})
        @alert = alert
        @badge = badge
        @sound = sound
        @content_available = content_available
        @category = category
        @priority = priority
        @custom_data = custom_data
      end

      def self.make_silent_push_parameter(priority: 10, custom_data: {})
        new(alert: '', badge: nil, sound: nil, content_available: 1, priority: priority, custom_data: custom_data)
      end

      def ==(other)
        serialize == other.serialize
      end

      def serialize
        {
          alert: @alert,
          badge: @badge,
          sound: @sound,
          content_available: @content_available,
          category: @category,
          priority: @priority,
          custom_data: @custom_data
        }.to_json
      end

      def self.unserialize(json)
        hash = JSON.parse(json).with_indifferent_access
        new(
          alert: hash[:alert],
          badge: hash[:badge],
          sound: hash[:sound],
          content_available: hash[:content_available],
          category: hash[:category],
          priority: hash[:priority],
          custom_data: hash[:custom_data]
        )
      end
    end
  end
end
