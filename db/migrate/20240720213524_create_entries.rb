class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries, id: :uuid do |t|
      t.string :slug
      t.string :title
      t.jsonb :content

      t.timestamps
    end
  end
end
