# frozen_string_literal: true

# Entries represent blog Entry that contain a title and a content block
class Entry < ApplicationRecord
  # Contains a slug for paramertized URL params
  attr_accessor :slug
  # Contains a title
  validates :title, presence: true
  # Contains a content text block
  validates :content, presence: true


  #TODO: add a state for managing draft, published, archived scopes
  #TODO: add versioning? Can an entry have many verions and maby the versions are what get 'published'?

  # Each entry is owned by a blog
  belongs_to :blog
  belongs_to :creator, class_name: 'User'

  has_many :comments, dependent: :destroy, inverse_of: :entry

  before_save :generate_slug

  # Update allows the title and/or the content to be updated
  def update(title: nil, content: nil)
    @title = title if title.present?
    @content = content if content.present?
  end

  private

  # Private generate method that gets called internally
  def generate_slug
    #TODO: ensure slug uniqueness
    self.title.parameterize
  end
end
