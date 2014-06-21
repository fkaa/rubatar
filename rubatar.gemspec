lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubatar/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubatar'
  spec.version       = Rubatar::VERSION
  spec.authors       = 'Felix Kaaman'
  spec.email         = 'trundmatu@gmail.com'
  spec.summary       = 'Generates random 5x5 avatars.'
  spec.homepage      = 'http://www.github.com/psuhh/rubatar'
  spec.license       = 'zlib'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = 'lib'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
