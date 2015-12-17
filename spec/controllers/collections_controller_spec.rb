require 'rails_helper'

describe CollectionsController do

  describe 'GET collection#show' do
  let!(:collection) { Collection.create(name: "Best Code Ever") }
  let!(:code_snippets) { CodeSnippet.create(collection_id: 1) }
  let!(:code_snippets) { CodeSnippet.create(collection_id: 2) }

    it "Assigns the collection as @collection" do
      get :show, { id: collection.to_param }
      expect(assigns(:collection)).to eq(collection)
    end

    it "assigns code snippets as @code_snippets" do
      #figure out test
    end

  end

  describe 'DELETE collection#delete' do
  let!(:collection) { Collection.create(name: "Best Code Ever") }

    it "Assigns the collection as @collection" do
      get :show, { id: collection.to_param }
      expect(assigns(:collection)).to eq(collection)
    end

    it "destroys a collection" do
      #figure out test
    end

  end
end
