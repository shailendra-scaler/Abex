require 'digest'

module Generators
  class Entity
    def initialize(token:, flag_key:)
      @token = token
      @flag_key = flag_key
    end

    def generate_id
      Digest::SHA1.hexdigest(@token.to_s + @flag_key.to_s)
    end
  end
end
