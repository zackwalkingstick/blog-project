class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags, id: :uuid do |t|
      t.string :name
      t.string :slug

      t.references :blog, index: true, type: :uuid, foreign_key: true
    end

    create_table :entries_tags, id: false do |t|
      t.belongs_to :tags
      t.belongs_to :entries
    end
  end
end
