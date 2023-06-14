module Featurable
  extend ActiveSupport::Concern

  included do

    # @param product [String] defining the product class,
    # @param uuid [String/Int] defining unique identifier for each user
    def init_feature_resources(product:, uuid:, skip_experiments: [])
      # this will be called from the including class which will send a
      # product and uuid
      @features = fetch_features(product, uuid, skip_experiments)

      # this method should be available in including module/class where @features will
      # be accessible
      return unless self.respond_to?(:after_feature_setup, true)
      after_feature_setup
    end

    def fetch_features(product, uuid, skip_experiments)
      # we will ask the user to create a constants file against the product
      # like Events::Features::Constants and place all the experiments and its keys there
      # we will take all the experiments from that module and the call fetch_varient method which
      # will generate a flag => variant_key
      # hash array for the experiments.
      product.constantize::Features::Constants::EXPERIMENTS.each do |experiment|
        next if skip_experiments.include(experiment)

        fetch_variant(experiment[:KEY], uuid)
      end
    end

    def fetch_variant(flag_key, uuid)
      # fetch variant from the experiment and call the evaluation method
      entity_id = ::Generators::Entity.new(
        token: uuid,
        flag_key: flag_key
      ).generate_id

      ::Abex::Evaluation.new.evaluate(
        {flag_key: flag_key, entity_id: entity_id}
      )
    end

    # to be implemented by including class we will skip fetching those results whose
    # experiment allowed is false
    # def experiment_valid?(experiment_name)
    #   return true unless self.respond_to?(:experiment_allowed?, true)
    #
    #   experiment_allowed?(experiment_name)
    # end

  end
end
