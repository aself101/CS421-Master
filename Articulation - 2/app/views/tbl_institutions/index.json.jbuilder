json.array!(@tbl_institutions) do |tbl_institution|
  json.extract! tbl_institution, :id, :institution_name, :city, :state, :zip, :website
  json.url tbl_institution_url(tbl_institution, format: :json)
end
