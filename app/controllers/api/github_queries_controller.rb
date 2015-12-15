class Api::GithubQueriesController < ApplicationController
  # respond_to :json

  # def index
  #   # debugger
  #   client = GithubQuery.new(session[:id])
  #   client.user_code_search(params[:keyword])
  #   urls = client.search_output_urls
  #   render json: client.query_to_json(urls)
  # end

  # def index
  #   # debugger
  #   client = GithubQuery.new(session[:id])
  #   query_results = client.user_code_search(params[:keyword])
  #   formatted_results = client.format_search(query_results)
  #   render json: { formatted_results: formatted_results }
  # end

  def repositories
    debugger
    client = GithubQuery.new(session[:id])
    repositories = client.repository_search
    render json: { repositories: repositories }
  end

  def query
    client = GithubQuery.new(session[:id])
    if params[:repo].present?
      query_results = client.repo_code_search(params[:keyword], params[:repo], params[:path])
    else
      query_results = client.user_code_search(params[:keyword], params[:path])
    end
    formatted_results = client.format_search(query_results)
    render json: { formatted_results: formatted_results }
  end

  def find_snippet
    client = GithubQuery.new(session[:id])
    encoded_response = client.get_request(params[:git_url])
    html_snippet = decoder(encoded_response[:content])
    render json: { code: html_snippet }
  end

end
