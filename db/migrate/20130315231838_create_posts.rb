class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user
      t.string :language
      t.text :code
      t.integer :size

      t.timestamps
    end
  end
end
