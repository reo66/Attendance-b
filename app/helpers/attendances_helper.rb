module AttendancesHelper
  
  def attendance_state(attendance)
    # 繰り返し処理で表示している時間と本日が同じか
    if Date.current == attendance.worked_on
      return "出勤" if attendance.started_at.nil?
      return "退勤" if attendance.started_at.present? && attendance.finished_at.nil?
    end  
    return false
  end 
  
  def working_times(start,finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
end