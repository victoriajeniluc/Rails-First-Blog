class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false 
      t.text :body, null: false 

      t.timestamps
    end
  end
end
