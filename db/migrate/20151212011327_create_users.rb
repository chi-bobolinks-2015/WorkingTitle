class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer   :github_id
      t.string    :name
      t.string    :email
      t.string    :html_url
      t.string    :avatar_url
      t.string    :access_token

      t.timestamps null: false
    end
  end
end
