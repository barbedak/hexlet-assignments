# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    request = Rack::Request.new(env)
    case request.path_info
    when '/'
      [200, { 'Content-Type' => 'text/html' }, ['Hello, World!']]
    when '/about'
      [200, { 'Content-Type' => 'text/html' }, ['About page']]
    else
      [404, { 'Content-Type' => 'text/html' }, ['404 Not Found']]
    end
  end
end
