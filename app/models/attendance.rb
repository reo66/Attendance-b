class Attendance < ApplicationRecord
  # userモデルと1対1の関係を示す
  belongs_to :user
end
