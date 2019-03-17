class Rack::Attack


  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  throttle('check_mail', limit: 5, period: 1.second) do |request|
    if request.path.include?('/check_mail') && request.get?
      request.ip
    end
  end

  #Custom response instead of retry later

  self.throttled_response = lambda do |env|
    [ 429,
      { 'Content-Type' => 'application/json' },
      [
          {
              success: false,
              error: {
                  code: 429,
                  message: "Too many requests, please try again LATER!"
              }
          }.to_json
      ]
    ]
  end

end