class Api::GithubQueriesController < ApplicationController
  # respond_to :json

  def index
    client = GithubQuery.new(session[:id])
    client.user_code_search(params[:keyword])
    urls = client.search_output_urls
    render json: client.query_to_json(urls)
  end

  def repositories
    client = GithubQuery.new(session[:id])
    repositories = client.repository_search
    render json: { repositories: repositories }
  end
end
