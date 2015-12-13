class Api::GithubQueriesController < ApplicationController
  respond_to :json

  def index
    client = GithubQuery.new.github_client
    client.user_code_search(params[:keyword])
    render json: query_to_json(search_output)
  end

end
