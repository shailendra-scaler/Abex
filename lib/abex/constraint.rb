module Abex
  class Constraint < Base

    def initialize
      super
      @api = Flagr::ConstraintApi.new
    end

    def create_constraint(flag_id:, segment_id:, opts: {})
      body = Flagr::CreateConstraintRequest.new
      # make constraint api call and return the result
    end

    def get_constraint(flag_id:, segment_id:)
      # make api call to find the constraint and return the result
    end

    def update_constraint(flag_id:, segment_id:, constraint_id:, opts: {})
      body = Flagr::CreateConstraintRequest.new
      # make api call to update the given constraint and return the result
    end

    def delete_constraint(flag_id, segment_id, constraint_id)
      # make api call to delete the constraint
    end
  end
end