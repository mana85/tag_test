class TagMap < ApplicationRecord
  belongs_to :post
  belongs_to :tag

  # 念のためバリデーション
  validates :post_id, presence: true
  validates :tag_id, presence: true
end
