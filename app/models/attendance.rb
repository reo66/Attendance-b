class Attendance < ApplicationRecord
  # userモデルと1対1の関係を示す
  belongs_to :user
  
  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }
end
