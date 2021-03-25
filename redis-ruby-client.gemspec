lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis_ruby_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'redis-ruby-client'
  spec.version       = RedisRubyClient::VERSION
  spec.summary       = 'redis-ruby-client'
  spec.description   = 'Sipmle client for Redis and pure Ruby applications'
  spec.authors       = ['Mykola Kaban']
  spec.email         = 'perelop@gmail.com'
  spec.files         = ['lib/redis_client.rb']

  spec.bindir        = 'exe'
  spec.require_paths = ['lib']
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.license       = 'MIT'
  spec.add_dependency "redis"

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug', '~> 10.0'
  spec.add_development_dependency 'fakeredis'
end