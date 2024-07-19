# frozen_string_literal: true

# The Post model represents a blog post.
class Post < ApplicationRecord
  validates :title, presence: true
end
