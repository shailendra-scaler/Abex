module Abex
  # Module to allow shorthand calls for Abex components
  module ViewHelper
    ABEX_HELPERS = {
      context: "Abex::ContextComponent",
      component: "Abex::Component"
    }.freeze

    ABEX_HELPERS.each do |name, component|
      define_method "abex_#{name}" do |*args, **kwargs, &block|
        render component.constantize.new(*args, **kwargs), &block
      end
    end
  end
end
