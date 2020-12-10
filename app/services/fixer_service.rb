require 'net/http'

class FixerService
  def initialize
    @base_url = 'http://data.fixer.io/api'
    @access_key = Rails.application.credentials[:fixer_api_access_key]
  end

  def import_currencies
    Currency.import(symbols)
  end

  def latest(base, target)
    uri = URI("#{@base_url}/latest")
    url_params = {
      access_key: @access_key,
      base: base,
      symbols: target
    }
    uri.query = URI.encode_www_form(url_params)

    res = Net::HTTP.get_response(uri)
    body = JSON.parse(res.body, symbolize_names: true)

    unless body[:success]
      return { errors: body[:error] }
    end

    body
  end

  def symbols
    uri = URI("#{@base_url}/symbols")
    url_params = {
      access_key: @access_key
    }
    uri.query = URI.encode_www_form(url_params)

    res = Net::HTTP.get_response(uri)
    body = JSON.parse(res.body, symbolize_names: true)

    unless body[:success]
      return { errors: body[:error] }
    end

    body[:symbols]
  end
end