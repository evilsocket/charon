require './lib/charon/version'

Gem::Specification.new do |s|
  s.name = %q{charon}
  s.version = Charon::VERSION
  s.license = "BSD"

  s.authors = ["Simone Margaritelli"]
  s.description = %q{A Ruby library to query the Zen service on SpamHaus.org}
  s.email = %q{evilsocket@gmail.com}
  s.files = Dir.glob("lib/**/*") + [
    "LICENSE",
    "README.md",
    "Rakefile",
    "charon.gemspec",
    "Gemfile"
  ]
  s.homepage = %q{http://github.com/evilsocket/charon}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{A Ruby library to query the Zen service on SpamHaus.org}

  s.test_files = Dir.glob("test/**/*")
  s.add_development_dependency(%q<minitest>, [">= 5.0.0"])
end


