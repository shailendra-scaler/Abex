# frozen_string_literal: true

module Abex
  class Component < ApplicationComponent
    def initialize(variant:, chosen_variant:)
      @variant = variant
      @chosen_variant = chosen_variant
    end
  
    # returns true/false
    # Corresponding component will only be rendered if this method return true
    def render?
      @variant.eql?(@chosen_variant)
    end
  end
end

