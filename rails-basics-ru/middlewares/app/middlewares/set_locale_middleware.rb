# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    dup._call(env)
  end

  def _call(env)
    @status, @headers, @response = @app.call(env)
    req = Rack::Request.new(env)
    locales = req.accept_language
    I18n.locale = locales.any? ? locales.first[0].to_sym : I18n.default_locale
    Rails.logger.debug(I18n.locale)
    [@status, @headers, @response]
  end
end
