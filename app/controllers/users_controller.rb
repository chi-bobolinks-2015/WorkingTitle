class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @collections = Collection.where(user_id: params[:id])
    @code_snippets = CodeSnippet.where(collection_id: params[:id])
  end
end
