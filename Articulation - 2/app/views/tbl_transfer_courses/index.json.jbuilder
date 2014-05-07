json.array!(@tbl_transfer_courses) do |tbl_transfer_course|
  json.extract! tbl_transfer_course, :id, :transferID, :transfer_course_alpha, :transfer_course_num, :course_title, :transfer_inst_name, :transfer_hours, :effective_term, :grp
  json.url tbl_transfer_course_url(tbl_transfer_course, format: :json)
end
