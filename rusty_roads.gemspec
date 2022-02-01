lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rusty_roads/version"
Gem::Specification.new do |s|
  s.name          = "rusty_roads"
  s.version       = RustyRoads::VERSION
  s.summary       = "A Rust replacement for Roadie"
  s.extensions    = ["Cargo.toml"]
  s.authors       = ["Becker"]
  s.files         = ["Cargo.toml", "Cargo.lock", "src/lib.rs"]
  s.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|s|features)/}) }
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rutie", "~> 0.0.3"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "minitest", "~> 5.0"
end
