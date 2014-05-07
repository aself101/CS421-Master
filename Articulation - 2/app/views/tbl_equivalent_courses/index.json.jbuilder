json.array!(@tbl_equivalent_courses) do |tbl_equivalent_course|
  json.extract! tbl_equivalent_course, :id, :transferID, :approvalID, :eq_course_alpha, :eq_course_num, :course_title, :eq_hours, :conn, :uhh_atr, :pr
  json.url tbl_equivalent_course_url(tbl_equivalent_course, format: :json)
end
