class Attendance < ApplicationRecord
  # userモデルと1対1の関係を示す
  belongs_to :user
  
  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }
  
  # 出勤時間が存在しない場合、退勤時間は無効
  validate :finished_at_is_invalid_without_a_started_at
  
  def finished_at_is_invalid_without_a_started_at
    # 出勤時間がからで退勤時間が存在する場合にエラーを出す
    errors.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
  end
end
