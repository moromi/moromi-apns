module Moromi::Apns::Message
  class Builder
    # @param [Hash] hash
    # @return Moromi::Apns::Message::Base
    def self.build(hash)
      params = hash.with_indifferent_access

      type = params[:type]
      return nil unless type.present?

      klass = type.safe_constantize
      klass.unserialize(params)
    end
  end
end
