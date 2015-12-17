class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :code_snippets

  validates :name, presence: true
end
