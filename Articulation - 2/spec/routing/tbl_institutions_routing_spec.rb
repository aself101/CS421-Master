require "spec_helper"

describe TblInstitutionsController do
  describe "routing" do

    it "routes to #index" do
      get("/tbl_institutions").should route_to("tbl_institutions#index")
    end

    it "routes to #new" do
      get("/tbl_institutions/new").should route_to("tbl_institutions#new")
    end

    it "routes to #show" do
      get("/tbl_institutions/1").should route_to("tbl_institutions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tbl_institutions/1/edit").should route_to("tbl_institutions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tbl_institutions").should route_to("tbl_institutions#create")
    end

    it "routes to #update" do
      put("/tbl_institutions/1").should route_to("tbl_institutions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tbl_institutions/1").should route_to("tbl_institutions#destroy", :id => "1")
    end

  end
end
