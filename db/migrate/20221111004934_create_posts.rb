class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      # タイトル
      t.string :title, null: false
      # コンテンツ
      t.text :content, null: false
      t.timestamps
    end
  end
end
