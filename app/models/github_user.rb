class GithubUser
  attr_reader :access_token, :github_user, :user

  def initialize(access_token)
    @access_token = access_token
    @github_user = request_github_user
    @user = find_or_create
  end

  def request_github_user
    client = Octokit::Client.new(:access_token => access_token)
    client.user
  end

  def find_or_create
    user = User.find_or_initialize_by(github_id: github_user.attrs.id)
    user.update(name: github_user.attrs.name,
                email: github_user.attrs.email,
                access_token: access_token)
  end

end
