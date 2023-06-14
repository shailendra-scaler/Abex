class EvaluationController < ApplicationController
  before_action :sanitize_params

  # Endpoint: GET /abex/evaluate
  def index
    render json: {success: true, data: { key: '', variant: '' }}, status: 200
  end

  # Endpoint: GET /abex/evaluate/batch
  def batch
    render json: {success: true, data: [{key: '', variant: ''}, {key: '', variant: ''}]}, status: 200
  end

  private

  def permitted_params
    params.require(:key).permit(:experiment_options)
  end

  def sanitize_params
    new_params = permitted_params

    head :bad_request and return unless new_params.dig(:key).present?
  end
end
