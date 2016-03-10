module Moromi::Apns::Environment
  class Base
    def identifier
      @identifier ||= Moromi::Apns.config.identifiers[key]
    end

    def key
      raise NotImplementedError
    end

    def sandbox?
      true
    end
  end
end
