json.array!(@submissions) do |submission|
  json.extract! submission, :id, :name, :student_id_number, :classification, :major, :address, :email, :phone, :transfer_institution, :term, :course_alpha, :course_number, :course_hours
  json.url submission_url(submission, format: :json)
end
