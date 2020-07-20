class User < ApplicationRecord
  # コールバックメソッドであるbefore_save=保存前、を呼び出す。
  # これに{ self.email = email.downcase }を渡している。
  # (ブロックはメアドを小文字にする内かつ、モデルインスタンスの関連データ)
  before_save { self.email = email.downcace }
  # 文字数制限かつ、空白で保存できない様に検証をかける
   validates :name,  presence: true, length: { maximum: 50 }
  # formatオプションの引数である正規表記を指定
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # 文字数制限かつ、空白で保存できない様に検証をかける
  validates :email, presence: true, length: { maximum: 100 },
  # メアドがsample@email.comの様な形かを検証（引数にVALID_EMAIL_REGEXを指定)
                     format: { with: VALID_EMAIL_REGEX },
                    #   同じ値がないかの検証
                    uniquness: true  
end
