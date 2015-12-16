class CodeSnippetsController < ApplicationController
  def create
    debugger
    code_snippet = CodeSnippet.create(code_url: snippet_params[:codeUrl], collection_id: snippet_params[:collectionId], code_content: snippet_params[:codeContent], path: snippet_params[:codePath])

    respond_to do |format|
      format.json { render json: code_snippet }
    end
  end

  private

  def snippet_params
    params.require(:codeSnippet).permit(:codeUrl, :collectionId, :codeContent, :codePath)
  end
end
