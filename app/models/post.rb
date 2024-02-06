class Post < ApplicationRecord
  validates :title, presence: true
  validates :context, presence: true
end
