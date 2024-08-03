class AddCreatorToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :creator_id, :uuid
    add_index :entries, :creator_id
    add_foreign_key :entries, :users, column: :creator_id
  end
end
