# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendgrid-ruby/version'

Gem::Specification.new do |spec|
  spec.name        = 'sendgrid-ruby'
  spec.version     = SendGrid::VERSION
  spec.authors     = ['Elmer Thomas', 'Robin Johnson', 'Eddie Zaneski']
  spec.email       = 'dx@sendgrid.com'
  spec.summary     = 'Official SendGrid Gem'
  spec.description = 'Interact with SendGrids API in native Ruby'
  spec.homepage    = 'http://github.com/sendgrid/sendgrid-ruby'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin/) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)/)
  spec.require_paths = ['lib']

  spec.add_dependency 'ruby_http_client', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'faker'
end
