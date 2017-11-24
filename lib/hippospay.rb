require "hippospay/version"

module Hippospay
  require 'digest'
  require 'json'
  require 'open-uri'
  require 'net/http'

  def get_hippo(day: "24", month: "4", year: "1987")
    page = '0'
    limit = '100'
    type = '1'
    api_url = 'https://shq-api.51fubei.com/gateway'
    app_id = ENV['hippo_app_id']
    app_secret = ENV['hippo_app_secret']
    method = 'openapi.payment.order.reconciliation'
    nonce = (0...32).map { ('a'..'z').to_a[rand(26)] }.join
    next_page = true
    daily_hippos = []

    while next_page do
      page = (page.to_i+1).to_s

      biz_content = {
        "day": day,
        "limit": limit,
        "month": month,
        "page": page,
        "type": type,
        "year": year
      }

      to_sign = "app_id=#{app_id}&biz_content=#{biz_content.to_json}&format=json&method=#{method}&nonce=#{nonce}&sign_method=md5&version=1.0#{app_secret}"

      sign = Digest::MD5.hexdigest(to_sign).upcase

      send = '{"biz_content":"{\"day\":\"'+day+'\",\"limit\":\"'+limit+'\",\"month\":\"'+month+'\",\"page\":\"'+page+'\",\"type\":\"'+type+'\",\"year\":\"'+year+'\"}","method":"'+method+'","format":"json","sign_method":"md5","sign":"'+sign+'","app_id":"'+app_id+'","nonce":"'+nonce+'","version":"1.0"}'

      uri = URI.parse(api_url)

      header = {'Content-Type': 'application/json'}

      # Create the HTTP objects
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = send

      # Send the request
      response = http.request(request)
      a = JSON.parse(response.body)

      result = a["data"]["list"]
      daily_hippos += result

      next_page = a["data"]["list"].any?
    end
    daily_hippos
  end
end
