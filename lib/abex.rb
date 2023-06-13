require "abex/engine"
require "view_component/engine"

module Abex
  #flagr server url
  mattr_accessor :flagr_host

  #flagr request scheme
  mattr_accessor :flagr_scheme
  @@flagr_scheme = 'http'

  #flagr request timeout
  mattr_accessor :flagr_timeout
  @@flagr_timeout = 1

  #list of paths where host app will store a hash
  # EXPERIMENT = {
  #   title: {
  #     key: 'flag_key'
  #   }
  # }

  mattr_accessor :experiment_module_paths
  @@experiment_module_paths = []

  # Abex config setup by Host app can be done using this method
  def self.setup
    yield

    @@feature_keys = fetch_feature_keys
  end

  def fetch_feature_keys
    feature_hash_list = modularize_experiment_module_paths
    #iterate over each feature_hash and extract the experiment keys from there
  end

  # @return [List] a hash of namespaced modules
  def modularize_experiment_module_paths
    # this method will iterate over @@experiment_module_paths and
    # ::EXPERIMENT will be appended to each path after converting it to module
    # eg app/modules/events/features/constants.rb will be converted to
    # ::Events::Features::Constants::EXPERIMENT
  end

end
