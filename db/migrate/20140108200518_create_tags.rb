class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.text :body
      t.string :link
      t.integer :user_id
      t.integer :rubric_id

      t.timestamps
    end
  end
end
