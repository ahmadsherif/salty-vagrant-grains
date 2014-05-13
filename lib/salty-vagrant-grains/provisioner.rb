require "#{Vagrant.source_root.join("plugins")}/provisioners/salt/provisioner"

require 'tempfile'
require 'yaml'

class VagrantPlugins::Salt::Provisioner
  alias_method :upload_configs_without_grains, :upload_configs
  def upload_configs
    upload_configs_without_grains

    grains_path = '/etc/salt/grains'
    grains_file = Tempfile.new('grains')
    grains_temp_path = "#{temp_config_dir}/#{File.basename(grains_file.path)}"

    grains_file.write(get_grains.to_yaml)
    grains_file.close

    @machine.env.ui.info "Adding custom grains in #{grains_path}"
    @machine.communicate.upload(grains_file.path, grains_temp_path)
    @machine.communicate.sudo("mkdir -p %s" % File.dirname(grains_path))
    @machine.communicate.sudo("cp %s %s" % [grains_temp_path, grains_path])
    @machine.communicate.sudo("chmod 644 %s" % grains_path)
  ensure
    grains_file.unlink
  end

  private

  def get_grains
    # Adapted from active_support gem
    @config.grains_data.keys.each do |key|
      @config.grains_data[key.to_s] = @config.grains_data.delete(key)
    end

    @config.grains_data
  end
end
