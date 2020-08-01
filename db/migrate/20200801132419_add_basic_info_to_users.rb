class AddBasicInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    # userモデルに 基本時間のカラムを追加。デフォルト値に8時間を指定
    add_column :users, :basic_time, :datetime,default: Time.current.change(hour: 8, min: 0, sec: 0)
    # userモデルに 勤務時間のカラムを追加。デフォルト値に7.5時間を指定
    add_column :users, :work_time, :datetime,default: Time.current.change(hour: 7, min: 30, sec: 0)
  end
end
