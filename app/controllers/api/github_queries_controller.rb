class Api::GithubQueriesController < ApplicationController
  # respond_to :json

  def index
    client = GithubQuery.new(session[:id])
    client.user_code_search("factory_girl")
    urls = client.search_output_urls
    render json: client.query_to_json(urls)
  end

end
