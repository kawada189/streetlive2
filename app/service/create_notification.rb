class CreateNotification
    include HTTParty
  
    API_URI = 'https://onesignal.com/api/v1/notifications'.freeze
  
    def self.call(*args)
      new(*args).call
    end
  
    def initialize(contents:, type:)
      @contents = contents
      @type     = type
    end
  
    def call
      HTTParty.post(API_URI, headers: headers, body: body)
    end
  
    private
  
    attr_reader :contents, :type
  
    def headers
      {
        'Authorization' => 'BASIC NTM0OTkxM2ItZDI4Yi00YWRiLWJmODgtYTczNjlkMjUxMTc3',
        'Content-Type'  => 'application/json'
      }
    end
  
    def body
      {
        'app_id' => 'b82feb20-fb32-40b2-8bdb-dd5d97805099',
        'url'    => 'localhost:3000',
        'data'   => { 'type': type },
        'included_segments' => ['All'],
        'contents' => contents
      }.to_json
    end
  end