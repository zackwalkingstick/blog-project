# frozen_string_literal: true

# A Blog class has a name and many entries. Each entry currently has a title and a content block.
class Blog < ApplicationRecord
  validates :name, presence: true

  # Blog has many entries
  has_many :entries, dependent: :destroy, inverse_of: :entry

  # Fetches all entries specific to this blog.
  #TODO: add pagination
  #TODO: add sorting and filtering
  def all_entries
    entries.all
  end

  def create_entry(title:, content:)
    @entry = Entry.new(title: title, content: content)
    @entry.save!
  end

  # Fetches a single entry by it's slug and returns it
  def entry(id:)
    entries.find(id)
  end

  # Fetches a single entry and allows updating the title and/or content. Calls the Post model helper
  def update_entry(id:, title: nil, content: nil)
    @entry = entries.find(id)
    @entry.update(title: title, content: content)
    @entry.save!
  end

  # Fetches a single entry and destroys it
  def delete_entry(id:)
    @entry = entries.find(id)
    @entry.destroy!
  end
end
