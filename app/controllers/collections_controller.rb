class CollectionsController < ApplicationController
  def create
    collection = Collection.create(name: collection_params[:collectionName], user_id: current_user.id)
    session[:collection_id] = collection.id
    respond_to do |format|
      format.json { render json: collection }
    end
  end

  def show
    @collection = Collection.find(params[:id])
    @code_snippets = CodeSnippet.where(collection_id: params[:id])
  end

  def delete
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to home_path
  end

  private

  def collection_params
    params.require(:collection).permit(:collectionName)
  end
end
