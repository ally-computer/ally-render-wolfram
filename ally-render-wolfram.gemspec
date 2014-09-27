# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ally/render/wolfram/version'

Gem::Specification.new do |spec|
  spec.name          = 'ally-render-wolfram'
  spec.version       = Ally::Render::Wolfram::VERSION
  spec.authors       = ['Chad Barraford']
  spec.email         = ['cbarraford@gmail.com']
  spec.description   = 'Ally render plugin that interfaces into wolfram alpha'
  spec.summary       = 'Ally render plugin for wolfram alpha'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'ally'
  spec.add_dependency 'wolfram'

  # development dependencies
  spec.add_development_dependency 'bundler', '~> 1.3'
  %w( rake rspec rubocop ally-io-test ).each do |gem|
    spec.add_development_dependency gem
  end
end
