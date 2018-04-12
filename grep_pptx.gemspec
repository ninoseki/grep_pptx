lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "urlscan/version"

Gem::Specification.new do |spec|
  spec.name          = "grep_pptx"
  spec.version       = GrepPptx::VERSION
  spec.authors       = ["ninoseki"]
  spec.email         = ["manabu.niseki@gmail.com"]

  spec.summary       = "Grep in MS Powerpoint(pptx) files"
  spec.homepage      = "https://github.com/ninoseki/grep_pptx"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "dotenv", "~> 2.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "rubyzip", "~> 1.2.1"
  spec.add_runtime_dependency "thor", "~> 0.20"
end
