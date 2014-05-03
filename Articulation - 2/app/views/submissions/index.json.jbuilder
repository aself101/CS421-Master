json.array!(@submissions) do |submission|
  json.extract! submission, :id, :name, :student_id, :classification, :major, :address, :email, :phone, :transfer institution, :, :term, :course alpha, :, :course number, :, :course hours, :, :uh hilo equivalent, :
  json.url submission_url(submission, format: :json)
end
