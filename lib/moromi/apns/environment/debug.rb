module Moromi::Apns::Environment
  class Debug < Base
    def key
      :debug
    end

    def sandbox?
      true
    end
  end
end
