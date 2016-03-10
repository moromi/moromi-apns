module Moromi::Apns::Environment
  class DefaultBuilder < Builder
    def self.all
      [
        Moromi::Apns::Environment::Production.new,
        Moromi::Apns::Environment::InHouse.new,
        Moromi::Apns::Environment::Debug.new
      ]
    end
  end
end
