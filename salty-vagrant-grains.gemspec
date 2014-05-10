# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'salty-vagrant-grains/version'

Gem::Specification.new do |spec|
  spec.name          = "salty-vagrant-grains"
  spec.version       = VagrantPlugins::SaltGrains::VERSION
  spec.authors       = ["Ahmad Sherif"]
  spec.email         = ["me@ahmadsherif.com"]
  spec.summary       = %q{Set SaltStack grains from Vagrantfile}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
