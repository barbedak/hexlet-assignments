# frozen_string_literal: true

require 'uri'
require 'forwardable'
require 'comparable'

class Url
  extend Forwardable
  include URI
  include Comparable

  attr_accessor :url

  def initialize(params)
    @url = params[:link]
  end

  def_delegators :@url, :scheme, :host, :port

  # http://yandex.ru?key=value&key2=value2
  def query_params
    result = {}
    _, params = @url.split('?')
    pairs = params.split('&')
    pairs.each do |pair|
      key, value = pair.split('=')
      result[:key] = :value
    end
    result
  end

  def query_param(key, value = nil)
    params = query_params(@url)
    params.fetch(key, value)
  end

  def ==(other)
    (@url.host == other.host) & (@url.scheme == other.scheme) &
      (@url.port == other.port) & (@url.query_params == other.query_params)
  end
end
