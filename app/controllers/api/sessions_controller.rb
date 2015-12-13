class Api::SessionsController < ApplicationController

  def login
    redirect_to GithubAuth.new.authorize
  end

  def callback
    access_token = GithubAccessToken.new(github_code).access_token
    user = GithubUser.new(access_token).user
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  private
  def github_code
    params.require(:code)
  end
end
