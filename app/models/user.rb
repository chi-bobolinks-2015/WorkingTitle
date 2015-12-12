class User < ActiveRecord::Base

  def request_github_user(access_token)
    client = Octokit::Client.new(:access_token => access_token)
    client.user
  end

end
