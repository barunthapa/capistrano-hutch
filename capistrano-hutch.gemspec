# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/hutch/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-hutch"
  spec.version       = Capistrano::Hutch::VERSION
  spec.authors       = ["Rustam Sharshenov"]
  spec.email         = ["rustam@sharshenov.com"]
  spec.summary       = "Hutch integration for Capistrano"
  spec.description   = "Hutch integration for Capistrano 3.1"
  spec.homepage      = "https://github.com/sharshenov/capistrano-hutch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'capistrano', "~> 3.1"
  spec.add_runtime_dependency 'hutch', ">= 0.10.0.pre"
end
