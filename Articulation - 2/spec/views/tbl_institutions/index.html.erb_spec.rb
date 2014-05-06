require 'spec_helper'

describe "tbl_institutions/index" do
  before(:each) do
    assign(:tbl_institutions, [
      stub_model(TblInstitution,
        :institution_name => "Institution Name",
        :city => "City",
        :state => "State",
        :zip => 1,
        :website => "Website"
      ),
      stub_model(TblInstitution,
        :institution_name => "Institution Name",
        :city => "City",
        :state => "State",
        :zip => 1,
        :website => "Website"
      )
    ])
  end

  it "renders a list of tbl_institutions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Institution Name".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
