require 'active_support'
require 'active_support/core_ext'
require 'active_support/json'
require 'net/http'

module WebPush
  ProductionOneSignalAppId="b82feb20-fb32-40b2-8bdb-dd5d97805099"
  ProductionSignalRestAPIKey="NTM0OTkxM2ItZDI4Yi00YWRiLWJmODgtYTczNjlkMjUxMTc3"

  def notification!
    params = {
      app_id: ProductionOneSignalAppId,
      rest_api_key: ProductionSignalRestAPIKey,
      headings: {en: "notification test", ja: "通知テストですよ"},
      contents: {en: "This is notification test", ja: "通知のテストですよ"},
      included_segments: ["All"]
    }
    one_signal_web_push(params)
  end

  def one_signal_web_push(params)
    raise "AppId or RestAPIKey is required" if params[:app_id].blank? || params[:rest_api_key].blank?
    raise "ContentsIsNone" if params[:contents].blank?
    params[:isChromeWeb] = true
    uri = URI.parse('https://onesignal.com/api/v1/notifications')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path,
                              'Content-Type' => 'application/json',
                              'Authorization' => "Basic #{params[:rest_api_key]}")
    request.body = params.as_json.to_json
    return http.request(request)
  end
end

include WebPush
notification!