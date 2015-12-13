# require 'Octokit'
# require 'base64'
# require 'json'

class GithubQuery
attr_reader :github_client, :code_query_results

  def initialize
    @github_client = request_github_client
  end

  def request_github_client
    client = Octokit::Client.new(:access_token => access_token)
  end

  def user_code_search(string)
    @code_query_results = github_client.search_code("#{string} user:#{github_client.login}", options = {})
  end

  def search_output_urls
    urls = []
    code_query_results.items.each do |item|
      hash = Hash.new
      hash[:url] = item.html_url
      urls << hash
    end
    urls.each do |item|
      item
    end
    urls
  end

  def query_to_json(search_output_urls)
    {search_output_urls: search_output_urls}.to_json
  end

end
