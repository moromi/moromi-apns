module Moromi::Apns::Message
  class Announce < Base
    def self.make(message:, url: nil, badge: 1)
      custom_data = {
        params: {
          url: url
        }
      }
      parameter = Moromi::Apns::Parameter.new(alert: message, badge: badge, custom_data: custom_data)
      new(parameter: parameter)
    end
  end
end
