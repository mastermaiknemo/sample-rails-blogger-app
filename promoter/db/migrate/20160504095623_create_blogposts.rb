class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
      t.text :content
      t.string :author

      t.timestamps null: false
    end
  end
end
