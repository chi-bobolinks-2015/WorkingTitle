class GithubQuery
attr_reader :github_client, :user_id, :user

  def initialize(user_id)
    @user_id = user_id
    @user = User.find(user_id)
    @github_client = request_github_client
  end

  def request_github_client
    Octokit::Client.new(:access_token => user.access_token, auto_traversal: true, per_page: 100)
  end

  def user_code_search(string, *path)
    Octokit.auto_paginate = true
    if path[0] != nil
      github_client.search_code("#{string} path:app/#{path[0]} user:#{github_client.login}", options = {})
    else
      github_client.search_code("#{string} user:#{github_client.login}", options = {})
    end
  end

  def repo_code_search(string, repo, *path)
    Octokit.auto_paginate = true
    if path[0] != nil
      github_client.search_code("#{string} path:app/#{path[0]} repo:#{repo}", options = {})
    else
      github_client.search_code("#{string} repo:#{repo}", options = {})
    end
  end

  def repository_search
    Octokit.auto_paginate = true
    repositories = []
    github_client.repositories.each do |repo|
      full_name = repo.full_name
      repositories << full_name
    end
    repositories
  end

  def format_search(repo_object)
    search_results = []
    repo_object.items.each do |item|
      if item.path !~ /\/\./
        hash = Hash.new
        hash[:path] = item.path
        hash[:raw_code] = get_request(item.git_url)
        hash[:url] = item.html_url
        search_results << hash
      end
    end
    search_results
  end

  def get_request(url)
    decoder(github_client.get(url).content)
  end

  def decoder(string)
    require 'base64'
    Base64.decode64(string)
  end
end
