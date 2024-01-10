# frozen_string_literal: true

require 'uri'
require 'forwardable'

class Url
  include URI
  include Comparable
  extend Forwardable

  attr_reader :url

  def initialize(link)
    @url = URI(link)
  end

  def_delegators :@url, :scheme, :host, :port

  def query_params()
    result = {}
    _, params = @url.to_s.split('?')
    unless params.nil?
      pairs = params.split('&') 
      pairs.each do |pair|
        key, value = pair.split('=')
        result[key.to_sym] = value
      end
    end
    result
  end

  def query_param(key, value = nil)
    params = query_params()
    params.fetch(key, value)
  end

  def <=>(other)
    (self.scheme <=> other.scheme) | (self.host <=> other.host) | (self.port <=> other.port) 
  end
end
