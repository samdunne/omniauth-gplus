lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/gplus/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-gplus"
  spec.version       = OmniAuth::GPlus::VERSION
  spec.authors       = ["Kurtis Rainbolt-Greene", "Sam Dunne"]
  spec.email         = ["me@kurtisrainboltgreene.name", "sam@sam-dunne.com"]
  spec.summary       = %q{A Google+ OAuth2 solution for Omniauth}
  spec.description   = spec.summary
  spec.homepage      = "http://samdunne.github.com/omniauth-gplus"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "omniauth-oauth2", '~> 1.1'
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'kramdown'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'coveralls'
end
