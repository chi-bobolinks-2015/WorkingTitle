class CreateCodeSnippets < ActiveRecord::Migration
  def change
    create_table :code_snippets do |t|
      t.string :code_url
      t.integer :collection_id

      t.timestamps null: false
    end
  end
end
