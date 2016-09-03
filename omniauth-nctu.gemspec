# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/nctu/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-nctu"
  spec.version       = Omniauth::Nctu::VERSION
  spec.authors       = ["Yuan-Yao Sung"]
  spec.email         = ["sungyuanyao@gmail.com"]

  spec.summary       = %q{OmniAuth OAuth2 strategy for NCTU Oauth}
  spec.description   = %q{This gem is an OmniAuth OAuth2 strategy for NCTU Oauth. NCTU students can use it to signup/login on their apps.}
  spec.homepage      = "https://github.com/deror1869107/omniauth-nctu"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth"
  spec.add_dependency 'omniauth-oauth2'
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
