require 'rails_helper'

describe CollectionsController do

  describe 'GET collection#show' do
  let!(:collection) { Collection.create(name: "Best Code Ever") }
  let!(:code_snippets) { CodeSnippet.create(collection_id: 1) }

    it "Assigns the collection as @collection" do
      get :show, { id: collection.to_param }
      expect(assigns(:collection)).to eq(collection)
    end

    it "assigns code snippets as @code_snippets" do
      get :show, { id: code_snippets.to_param }
      expect(assigns(:code_snippets)).to eq(code_snippets)
    end

  end
end
