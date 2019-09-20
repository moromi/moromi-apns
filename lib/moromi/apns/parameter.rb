require 'json'
require 'active_support/core_ext/hash'

module Moromi
  module Apns
    class Parameter
      PUSH_TYPE_ALERT = 1
      PUSH_TYPE_BACKGROUND = 2

      attr_reader :alert
      attr_reader :badge
      attr_reader :sound
      attr_reader :mutable_content
      attr_reader :category
      attr_reader :priority
      attr_reader :custom_data

      def initialize(alert:, badge:, sound: 'default', push_type: PUSH_TYPE_ALERT, mutable_content: 0, category: nil, priority: 10, custom_data: {}, **options)
        @alert = alert
        @badge = badge
        @sound = sound
        @push_type = normalize_push_type(push_type)
        @mutable_content = mutable_content
        @category = category
        @priority = priority
        @custom_data = custom_data
        @options = options
      end

      def self.make_silent_push_parameter(priority: 10, custom_data: {})
        new(alert: '', badge: nil, sound: nil, push_type: PUSH_TYPE_BACKGROUND, priority: priority, custom_data: custom_data)
      end

      def ==(other)
        serialize == other.serialize
      end

      # https://docs.aws.amazon.com/ja_jp/sns/latest/dg/sns-send-custom-platform-specific-payloads-mobile-devices.html#mobile-push-send-message-apns-background-notification
      def content_available
        case @push_type
        when PUSH_TYPE_ALERT
          'alert'
        when PUSH_TYPE_BACKGROUND
          1
        else
          'alert'
        end
      end

      def serialize
        {
          alert: @alert,
          badge: @badge,
          sound: @sound,
          push_type: @push_type,
          mutable_content: @mutable_content,
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
          push_type: hash[:push_type],
          mutable_content: hash[:mutable_content],
          category: hash[:category],
          priority: hash[:priority],
          custom_data: hash[:custom_data]
        )
      end

      private

      def normalize_push_type(value)
        case value
        when PUSH_TYPE_ALERT
          PUSH_TYPE_ALERT
        when PUSH_TYPE_BACKGROUND
          PUSH_TYPE_BACKGROUND
        else
          PUSH_TYPE_ALERT
        end
      end
    end
  end
end
