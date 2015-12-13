class Api::GithubQueriesController < ApplicationController
  respond_to :json

  def index
    client = GithubUser.new.github_client
    client.user_code_search(params[:search])
    render json: query_to_json(search_output)
  end

end
