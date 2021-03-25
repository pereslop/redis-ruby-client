# frozen_string_literal: true

require 'redis'

# Simple wrapper on redis client
class RedisClient
  ALLOWED_OPTIONS = %i[host port db password].freeze
  attr_accessor :client

  def initialize(options = {})
    @client = Redis.new(permitted_options(options))
  end

  def read(key)
    Marshal.load(@client.get(key))
  end

  def write(key, value, expires_in: nil)
    if expires_in
      @client.setex(key, expires_in, Marshal.dump(value))
    else
      @client.set(key, Marshal.dump(value))
    end
  end

  def fetch(key, expires_in: nil)
    value =get(key)
    value = yield if block_given? && value.nil?
    set(key, Marshal.dump(value), expires_in: expires_in)
  end

  private

  def permitted_options(options)
    options.slice(ALLOWED_OPTIONS)
  end
end
