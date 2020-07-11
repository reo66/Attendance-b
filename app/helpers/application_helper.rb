module ApplicationHelper
# ページ名があるか否かでタイトルを条件分岐  
  def full_title(page_name = "")
    base_title = "Attendance.B"
    if page_name.empty?
      base_title
    else
       page_name + " | " + base_title
    end
  end  
end
