require "spec_helper"

describe TblTransferCoursesController do
  describe "routing" do

    it "routes to #index" do
      get("/tbl_transfer_courses").should route_to("tbl_transfer_courses#index")
    end

    it "routes to #new" do
      get("/tbl_transfer_courses/new").should route_to("tbl_transfer_courses#new")
    end

    it "routes to #show" do
      get("/tbl_transfer_courses/1").should route_to("tbl_transfer_courses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tbl_transfer_courses/1/edit").should route_to("tbl_transfer_courses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tbl_transfer_courses").should route_to("tbl_transfer_courses#create")
    end

    it "routes to #update" do
      put("/tbl_transfer_courses/1").should route_to("tbl_transfer_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tbl_transfer_courses/1").should route_to("tbl_transfer_courses#destroy", :id => "1")
    end

  end
end
