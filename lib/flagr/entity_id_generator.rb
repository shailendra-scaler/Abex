require 'digest'

module ConsistenceHashing

  def self.generate_entity_id(uuid:, flag_key:)
    Digest::SHA1.hexdigest(uuid.to_s + flag_key.to_s)
  end

end
