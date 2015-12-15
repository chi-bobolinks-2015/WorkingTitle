class Api::GithubQueriesController < ApplicationController
  # respond_to :json

  def index
    # debugger
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

  def query
    client = GithubQuery.new(session[:id])
    if params[:repo]
      query_results = client.repo_code_search(params[:keyword], params[:repo], params[:path])
    else
      query_results = client.user_code_search(params[:keyword], params[:path])
    end
    render json: { query_results: query_results }
  end

end
