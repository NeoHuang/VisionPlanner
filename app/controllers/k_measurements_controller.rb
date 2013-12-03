class KMeasurementsController < ApplicationController
  before_action :set_k_measurement, only: [:show, :edit, :update, :destroy]

  # GET /k_measurements
  # GET /k_measurements.json
  def index
    @k_measurements = KMeasurement.all
  end

  # GET /k_measurements/1
  # GET /k_measurements/1.json
  def show
  end

  # GET /k_measurements/new
  def new
    @k_measurement = KMeasurement.new
  end

  # GET /k_measurements/1/edit
  def edit
  end

  # POST /k_measurements
  # POST /k_measurements.json
  def create
    @k_measurement = KMeasurement.new(k_measurement_params)

    respond_to do |format|
      if @k_measurement.save
        format.html { redirect_to @k_measurement, notice: 'K measurement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @k_measurement }
      else
        format.html { render action: 'new' }
        format.json { render json: @k_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /k_measurements/1
  # PATCH/PUT /k_measurements/1.json
  def update
    respond_to do |format|
      if @k_measurement.update(k_measurement_params)
        format.html { redirect_to @k_measurement, notice: 'K measurement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @k_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /k_measurements/1
  # DELETE /k_measurements/1.json
  def destroy
    @k_measurement.destroy
    respond_to do |format|
      format.html { redirect_to k_measurements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_k_measurement
      @k_measurement = KMeasurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def k_measurement_params
      params.require(:k_measurement).permit(:timestamp, :k1, :k2, :axis, :white_to_white, :pupil_x, :pupil_y, :pupil_rx, :pupil_ry, :pupil_q, :limbus_x, :limbus_y, :limbus_rx, :limbus_ry, :limbus_q, :cr_x, :cr_y, :cr_q, :patient_id, :image)
    end
end
