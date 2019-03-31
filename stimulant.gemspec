lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stimulant/version"

Gem::Specification.new do |spec|
  spec.name          = "stimulant"
  spec.version       = Stimulant::VERSION
  spec.authors       = ["en30"]
  spec.email         = ["en30.git@gmail.com"]

  spec.summary       = "Helper to integrate Stimulus into Rails application"
  spec.homepage      = "https://github.com/en30/stimulant"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 5.1"
  spec.add_dependency "railties",      ">= 5.1"
  spec.add_development_dependency "bundler", "~> 2.0"
end