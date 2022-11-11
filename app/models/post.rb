class Post < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :title, presence: true
  validates :content, presence: true

  def save_tags(tags)
    # タグをスペースで区切り配列化
    tag_list = tags.split(/[[:blank]]+/)
    # 自分に関連づいたタグを取得する
    current_tags = self.tags.pluck(:name)
    # 1.自分に紐づいていたタグと投稿されたタグの差分を抽出
    # *時期更新時に削除されたタグ
    old_tags = current_tags - tag_list
    # 2.自分に紐づいていたタグと投稿されたタグの差分を抽出
    # *新規に追加されたタグ
    new_tags = tag_list - current_tags
    p current_tags
    # tag_mapsテーブルから1のタグを削除
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    # tagsテーブルから2のタグを探してtag_mapsテーブルにtag_idを追加
    new_tags.each do |new|
      # 条件のレコードを始めの1件を取得し、なければ作成
      new_post_tag = Tag.find_or_create_by(name: new)
      # tags_mapsテーブルにpost_idとtag_idを保存
      self.tags << new_post_tag
    end
  end
end
