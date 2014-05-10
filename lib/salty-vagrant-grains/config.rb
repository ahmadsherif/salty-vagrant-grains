require "#{Vagrant.source_root.join("plugins")}/provisioners/salt/config"

class VagrantPlugins::Salt::Config
  attr_reader :grains_data

  alias_method :initialize_without_grains, :initialize
  def initialize
    initialize_without_grains

    @grains_data = UNSET_VALUE
  end

  alias_method :finalize_without_grains!, :finalize!
  def finalize!
    finalize_without_grains!

    @grains_data = {} if @grains_data == UNSET_VALUE
  end

  def grains(data)
    @grains_data = {} if @grains_data == UNSET_VALUE
    @grains_data = Vagrant::Util::DeepMerge.deep_merge(@grains_data, data)
  end
end
