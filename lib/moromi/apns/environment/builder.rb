module Moromi::Apns::Environment
  class Builder
    class << self
      def all
        raise NotImplementedError
      end

      def build(identifier)
        all.each do |environment|
          return environment if identifier == environment.identifier
        end

        raise InvalidEnvironment
      end
    end
  end
end
