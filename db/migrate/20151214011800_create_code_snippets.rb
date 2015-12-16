class CreateCodeSnippets < ActiveRecord::Migration
  def change
    create_table :code_snippets do |t|
      t.string :code_url
      t.text   :code_content
      t.integer :collection_id
      t.string :path

      t.timestamps null: false
    end
  end
end
