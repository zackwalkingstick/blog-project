class AddBlogToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :blog_id, :uuid
    add_index :entries, :blog_id
    add_foreign_key :entries, :blogs, column: :blog_id
  end
end
