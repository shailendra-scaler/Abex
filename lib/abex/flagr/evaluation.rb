module Abex

  class Evaluation < Base

    # initialises the evaluation class
    def initialize
      super

      @api = Flagr::EvaluationApi.new
    end

    # @param opts [Hash] keys: entity_id entity_type entity_context enable_debug flag_id flag_key flag_tags
    # @return the variant_key fetched from flaggr
    def evaluation(opts: {})
      body = Flagr::EvalContext.new

      # assign eval context objects
      # create api evaluation api call and return the result
    end

    # @param opts [Hash] keys: entities enable_debug flag_i_ds flag_keys flag_tags
    # @return [Hash] containing flag_ids => variant_key
    def batch_evaluation(opts: {})
      body = Flagr::EvaluationBatchRequest.new
      # create batch api call and return the result
    end

    private

    def create_evaluation_request_body(opts: {})
      # creates request body for the evaluation api call
    end

    def create_batch_evaluation_request_body(opts: {})
      # creates request body for the batch evaluation api call
    end

  end
end