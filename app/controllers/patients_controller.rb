class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    puts params;
=begin
    patient_params = ActiveSupport::JSON.decode(params[:data]);
    @patient = Patient.new;
    @patient.firstname = patient_params['firstname'];
    @patient.lastname = patient_params['lastname'];
    @patient.birth = Date.strptime(patient_params['birth'], "%Y-%m-%d");
    @patient.gender = patient_params['gender'];
=end
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
    format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
  
  def search
    query = params[:query];
    if query.blank?
      @patients = Patient.all;
    else
    q = "%#{query}%"
    puts q
    @patients = Patient.where("firstname LIKE ? OR lastname LIKE ?", q, q)


    end
    render :layout => false;
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      tmp = params.require(:patient).permit(:firstname, :lastname, :birth, :gender)
      tmp['birth'] = Date.strptime(tmp['birth'], "%Y-%m-%d")
      tmp
    end
end
