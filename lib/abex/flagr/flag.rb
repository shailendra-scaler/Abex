module Abex
  class Flag < Base
    def initialize
      super
      @api = Flagr::FlagApi.new
    end

    def create_flag(opts: {})
      body = Flagr::CreateFlagRequest.new
      # create body using opts, make api call and return the result
    end

    def delete_flag(flag_id:)
      # make api call and return the result
    end

    def find_flags(opts: {})
      # body = create the valid hash using opts, make the api call and return the result
    end

    def

  end
end