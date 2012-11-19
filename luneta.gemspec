# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "luneta/version"

Gem::Specification.new do |s|
  s.name        = "luneta"
  s.version     = Luneta::VERSION
  s.authors     = ["Jason Torres"]
  s.email       = ["jason.e.torres@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{An über simple web microframework built on rack and tilt.}
  s.description = %q{An über simple web microframework built on rack and tilt.}

  s.rubyforge_project = "luneta"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "minitest", "~> 4.2.0"
  s.add_development_dependency "rack-test"
  s.add_runtime_dependency "tilt"
  s.add_runtime_dependency "rack"
end
