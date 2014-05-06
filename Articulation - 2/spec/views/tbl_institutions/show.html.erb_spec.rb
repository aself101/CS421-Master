require 'spec_helper'

describe "tbl_institutions/show" do
  before(:each) do
    @tbl_institution = assign(:tbl_institution, stub_model(TblInstitution,
      :institution_name => "Institution Name",
      :city => "City",
      :state => "State",
      :zip => 1,
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Institution Name/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/1/)
    rendered.should match(/Website/)
  end
end
