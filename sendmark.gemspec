# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendmark/version'

Gem::Specification.new do |spec|
  spec.name          = "sendmark"
  spec.version       = Sendmark::VERSION
  spec.authors       = ["tnoda78"]
  spec.email         = ["tn78adsl@gmail.com"]

  spec.summary       = %q{Send email by markdown text.}
  spec.homepage      = "http://github.com/tnoda78/sendmark"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.2.10"

  spec.add_dependency "redcarpet", "~> 3.5"
  spec.add_dependency "mail", "~> 2.6"
  spec.add_dependency "css_parser", "~> 1.4"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "rspec-mocks", "~> 3.10"
end
