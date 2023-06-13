# frozen_string_literal: true

module Abex
  class ContextComponent < ApplicationComponent
    attr_reader :variant
  
    def initialize(default_variant:, request_opts: {})
      @variant = default_variant
      @request_opts = request_opts
    end
  
    # returns true/false
    # Corresponding component will only be rendered if this method return true
    def render?
      @variant.present? && @request_opts.present?
    end
  
    # before rendering the component, do any assignments or use any helpers here
    # This is called right before rendering a component
    # It's the only lifecycle of a view component
    def before_render
      # make Flagr api call before rendering the component
      @variant = ::Flagr::Evaluation.new.evaluate(@request_opts) || @variant
    end
  end
end
