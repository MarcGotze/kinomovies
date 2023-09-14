class CreateDislikedTags < ActiveRecord::Migration[7.0]
  def change
    create_table :disliked_tags do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
