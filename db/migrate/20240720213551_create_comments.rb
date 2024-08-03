class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.string :title
      t.text :description

      t.references :entry, index: true, type: :uuid, foreign_key: true
      t.references :creator, index: true, type: :uuid, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
