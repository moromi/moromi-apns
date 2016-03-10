module Moromi::Apns::Environment
  class Production < Base
    def key
      :production
    end

    def sandbox?
      true
    end
  end
end
