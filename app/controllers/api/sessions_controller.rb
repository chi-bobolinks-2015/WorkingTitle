class Api::SessionsController < ApplicationController
  respond_to :json

  def login
    redirect_to GithubAuth.new.authorize
  end

  def callback
    access_token = GithubAccessToken(params[:code]).access_token

    render json: GithubUser.new(access_token).user
  end
end
