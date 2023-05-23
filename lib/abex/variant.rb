module Abex
  class Variant
    def initialize
      super
      @api = Flagr::VariantApi.new
    end

    def find_variants(flag_id)
      resp = @api.find_variants(flag_id)
      # returns the array of varients
      # filter out keys and return the result
    end

    def delete_variant(flag_id, variant_id)
      resp = @api.delete_variant(flag_id, variant_id)
      #returns success
    end

    def create_variant(flag_id:, opts: {})
      body = Flagr::CreateVariantRequest.new
      #create the request body using above
      # then
      result = @api.create_variant(flag_id, body)
    end

    def update_variant(flag_id:, variant_id:, opts: {})
      body = Flagr::PutVariantRequest.new
      # form the request body using above and return the result
      result = @api.put_variant(flag_id, variant_id, body)
    end
  end
end