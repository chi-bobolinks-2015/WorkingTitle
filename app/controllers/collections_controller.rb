class CollectionsController < ApplicationController
  def create
    collection = Collection.create(name: collection_params[:collectionName], user_id: current_user.id)

    respond_to do |format|
      format.json { render json: collection }
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:collectionName)
  end
end
