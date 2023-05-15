module Abex
  module Featurable
    extend ActiveSupport::Concern

    included do

      # @param product [String] defining the product class,
      # @param uuid [String/Int] defining unique identifier
      def init_feature_resources(product:, uuid: )
        # this will be called from the including class which will send a
        # product and uuid
        @features = fetch_features(product, uuid)

        # this method should be available in including module/class where @features will
        # be accessible
        return unless self.respond_to?(:after_feature_setup, true)
        after_feature_setup
      end

      def fetch_features(product, uuid)
        # we will ask the user to create a constants file against the product
        # like Events::Features::Constants and place all the experiments and its keys there
        # we will take all the experiments from that module and the call fetch_varient method which
        # will generate a flag => variant_key
        # hash array for the experiments.
      end

      def fetch_variant(product, experiments, uuid)
        # fetch varient from the experiment and call the evaluation method
        entity_id = Abex::ConsistenceHashing.generate_entity_id(
          uuid: uuid,
          flag_key: flag_key
        )
        ::Abex::Evaluation.new.evaluate(
          {flag_key: flag_key, entity_id: entity_id}
        )
      end

      # to be implemented by including class we will skip fetching those results whose
      # experiment allowed is false
      def experiment_valid?(experiment_name)
        return true unless self.respond_to?(:experiment_allowed?, true)

        experiment_allowed?(experiment_name)
      end


    end
  end
end