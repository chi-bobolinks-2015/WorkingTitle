class Api::GithubQueriesController < ApplicationController

  def repositories
    client = GithubQuery.new(session[:id])
    repositories = client.repository_search
    render json: { repositories: repositories }
  end

  def query
    paths = []
    if params[:paths]
      JSON.parse(params[:paths]).each do |key, value|
        if value
          paths << key
        end
      end
    end

    client = GithubQuery.new(session[:id])
    if params[:repo].present?
      query_results = client.repo_code_search(params[:keyword], params[:repo], paths[0])
    else
      query_results = client.user_code_search(params[:keyword], paths[0])
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
