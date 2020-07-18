class User < ApplicationRecord
  # 文字数制限かつ、空白で保存できない様に検証をかける
  validates :name,precence: true, length: {maximum: 50 }
  validates :email,presence: true, length: { maximum: 100 }
end
