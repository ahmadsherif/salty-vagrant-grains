# Salty Vagrant Grains

Set SaltStack grains from Vagrantfile

## Installation

    vagrant plugin install salty-vagrant-grains

## Usage

```ruby
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'saucy64'

  config.vm.provision :salt do |salt|
    salt.grains({
      roles: ['webserver', 'memcache'],
      deployment: 'datacenter4',
      cabinet: '13',
      cab_u: '14-15',
    })

    salt.grains({
      cab_u: '14-15',
    })
  end
end
```
