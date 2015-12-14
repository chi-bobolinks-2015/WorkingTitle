class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @collections = Collection.where(user_id: params[:id])
    @code_snippets = CodeSnippet.where(collection_id: params[:id])
  end
end
