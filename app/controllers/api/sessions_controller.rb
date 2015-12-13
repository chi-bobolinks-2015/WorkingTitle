class Api::SessionsController < ApplicationController

  def login
    redirect_to GithubAuth.new.authorize
  end

  def callback
    access_token = GithubAccessToken.new(github_code).token
    user = GithubUser.new(access_token).user
    if user.save
      session[:id] = user.id
      render json: user, status: 201
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  private
  def github_code
    params.require(:code)
  end
end
