class User < ActiveRecord::Base
  has_many :collections
  has_many :code_snippets, through: :collections
end
