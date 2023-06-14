
class Evaluation

  # initialises the evaluation class
  def initialize
    super

    @api = Flagr::EvaluationApi.new
  end

  # @param opts [Hash] keys: entity_id entity_type entity_context enable_debug flag_id flag_key flag_tags
  # @return the variant_key fetched from flaggr
  def evaluate(opts: {})
    body = create_evaluation_request_body(opts: {})
    # assign eval context objects
    # create api evaluation api call and return the result
    fetch_variant(api_result)
  end

  # @param opts [Hash] keys: entities enable_debug flag_i_ds flag_keys flag_tags
  # @return [Hash] containing flag_ids => variant_key
  def batch_evaluate(opts: {})
    body = create_batch_evaluation_request_body(opts: {})
    # create batch api call and return the result
    fetch_variants(api_result)
  end

  private

  def create_evaluation_request_body(opts: {})
    body = Flagr::EvalContext.new
    # creates request body for the evaluation api call
  end

  def create_batch_evaluation_request_body(opts: {})
    body = Flagr::EvaluationBatchRequest.new
    # creates request body for the batch evaluation api call
  end

  def fetch_variant(result)
    # fetches the api result and return the varient
  end

  def fetch_variants(result)
    # fetches the api result and return the varients hash
  end

end