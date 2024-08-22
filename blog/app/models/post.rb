# frozen_string_literal: true

# The Post model represents a blog post.
class Post < ApplicationRecord
  include PgSearch::Model
  has_rich_text :content
  pg_search_scope :search_by_title_and_content, against: :title, associated_against: { rich_text_content: :body }
  validates :title, presence: true
end
