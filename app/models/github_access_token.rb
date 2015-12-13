class GithubAccessToken
  attr_reader :result

  def initialize(code)
    @result = RestClient.post('https://github.com/login/oauth/access_token',
                          {:client_id => ENV['CLIENT_ID'],
                           :client_secret => ENV['CLIENT_SECRET'],
                           :code => code},
                           :accept => :json)
  end

  def token
    JSON.parse(result)['access_token']
  end
end
