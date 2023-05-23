module Abex
  class VariantsController < ApplicationController

    def show
      # perform validation checks
      resp = Abex::Variant.new.find_variants(params[:flag_id])
      # This will return all the varients related to a particular flag id
      # return the response
    end

    def update
      # create the variants
    end

    def destroy
      # delete the variants
    end

    def create
      # create the variants
    end
  end
end