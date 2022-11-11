class CreateTagMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_maps do |t|

      # postと関連付ける
      t.references :post, foreign_key: true
      # タグと関連づけるためのカラム
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
