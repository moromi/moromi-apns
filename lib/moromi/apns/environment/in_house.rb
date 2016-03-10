module Moromi::Apns::Environment
  class InHouse < Base
    def key
      :in_house
    end

    def sandbox?
      true
    end
  end
end
