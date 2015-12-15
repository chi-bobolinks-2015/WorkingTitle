class CodeSnippetsController < ApplicationController
  def create
    code_snippet = CodeSnippet.create(code_url: snippet_params[:codeUrl], collection_id: snippet_params[:collectionId])

    respond_to do |format|
      format.json { render json: code_snippet }
    end
  end

  private

  def snippet_params
    params.require(:codeSnippet).permit(:codeUrl, :collectionId)
  end
end
