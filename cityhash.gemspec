# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cityhash/version"

Gem::Specification.new do |s|
  s.name        = "cityhash"
  s.version     = Cityhash::VERSION
  s.authors     = ["Vasiliy Ermolovich"]
  s.email       = ["younash@gmail.com"]
  s.homepage    = "http://github.com/nashby/cityhash"
  s.summary     = %q{ruby bindings for google's cityhash}
  s.description = %q{ruby bindings for google's cityhash}

  s.rubyforge_project = "cityhash"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.extensions    = ["ext/cityhash/extconf.rb"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "ffi"
end
