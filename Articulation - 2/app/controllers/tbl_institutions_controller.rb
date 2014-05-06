class TblInstitutionsController < ApplicationController
  before_action :set_tbl_institution, only: [:show, :edit, :update, :destroy]

  # GET /tbl_institutions
  # GET /tbl_institutions.json
  def index
    @tbl_institutions = TblInstitution.all
  end

  # GET /tbl_institutions/1
  # GET /tbl_institutions/1.json
  def show
  end

  # GET /tbl_institutions/new
  def new
    @tbl_institution = TblInstitution.new
  end

  # GET /tbl_institutions/1/edit
  def edit
  end

  # POST /tbl_institutions
  # POST /tbl_institutions.json
  def create
    @tbl_institution = TblInstitution.new(tbl_institution_params)

    respond_to do |format|
      if @tbl_institution.save
        format.html { redirect_to @tbl_institution, notice: 'Tbl institution was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tbl_institution }
      else
        format.html { render action: 'new' }
        format.json { render json: @tbl_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_institutions/1
  # PATCH/PUT /tbl_institutions/1.json
  def update
    respond_to do |format|
      if @tbl_institution.update(tbl_institution_params)
        format.html { redirect_to @tbl_institution, notice: 'Tbl institution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tbl_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_institutions/1
  # DELETE /tbl_institutions/1.json
  def destroy
    @tbl_institution.destroy
    respond_to do |format|
      format.html { redirect_to tbl_institutions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_institution
      @tbl_institution = TblInstitution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_institution_params
      params.require(:tbl_institution).permit(:institution_name, :city, :state, :zip, :website)
    end
end
