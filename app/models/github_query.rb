class GithubQuery
attr_reader :github_client, :code_query_results, :user_id, :user

  def initialize(user_id)
    @user_id = user_id
    @user = User.find(user_id)
    @github_client = request_github_client
  end

  def request_github_client
    Octokit::Client.new(:access_token => user.access_token, auto_traversal: true, per_page: 100)
  end

  def user_code_search(string)
    Octokit.auto_paginate = true
    @code_query_results = github_client.search_code("#{string} user:#{github_client.login}", options = {})
  end

  def org_code_search(string)
    Octokit.auto_paginate = true
    github_client.search
  end

  def repository_search
    Octokit.auto_paginate = true
    repositories = []
    github_client.repositories.each do |repo|
      full_name = repo.full_name
      repositories << full_name
        # if github_client.commits("#{full_name}", 'master', {author: "#{user.name}"}).present?
        #   repositories << full_name
        # end
    end
    repositories
  end

  def search_output_urls
    urls = []
    code_query_results.items.each do |item|
      hash = Hash.new
      hash[:url] = item.html_url
      urls << hash
    end
    urls
  end

  def query_to_json(search_output_urls)
    {search_output_urls: search_output_urls}.to_json
  end
end
