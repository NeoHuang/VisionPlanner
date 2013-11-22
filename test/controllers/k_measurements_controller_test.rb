require 'test_helper'

class KMeasurementsControllerTest < ActionController::TestCase
  setup do
    @k_measurement = k_measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:k_measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create k_measurement" do
    assert_difference('KMeasurement.count') do
      post :create, k_measurement: { axis: @k_measurement.axis, cr_q: @k_measurement.cr_q, cr_x: @k_measurement.cr_x, cr_y: @k_measurement.cr_y, k1: @k_measurement.k1, k2: @k_measurement.k2, limbus_q: @k_measurement.limbus_q, limbus_rx: @k_measurement.limbus_rx, limbus_ry: @k_measurement.limbus_ry, limbus_x: @k_measurement.limbus_x, limbus_y: @k_measurement.limbus_y, patient_id: @k_measurement.patient_id, pupil_q: @k_measurement.pupil_q, pupil_rx: @k_measurement.pupil_rx, pupil_ry: @k_measurement.pupil_ry, pupil_x: @k_measurement.pupil_x, pupil_y: @k_measurement.pupil_y, timestamp: @k_measurement.timestamp, white_to_white: @k_measurement.white_to_white }
    end

    assert_redirected_to k_measurement_path(assigns(:k_measurement))
  end

  test "should show k_measurement" do
    get :show, id: @k_measurement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @k_measurement
    assert_response :success
  end

  test "should update k_measurement" do
    patch :update, id: @k_measurement, k_measurement: { axis: @k_measurement.axis, cr_q: @k_measurement.cr_q, cr_x: @k_measurement.cr_x, cr_y: @k_measurement.cr_y, k1: @k_measurement.k1, k2: @k_measurement.k2, limbus_q: @k_measurement.limbus_q, limbus_rx: @k_measurement.limbus_rx, limbus_ry: @k_measurement.limbus_ry, limbus_x: @k_measurement.limbus_x, limbus_y: @k_measurement.limbus_y, patient_id: @k_measurement.patient_id, pupil_q: @k_measurement.pupil_q, pupil_rx: @k_measurement.pupil_rx, pupil_ry: @k_measurement.pupil_ry, pupil_x: @k_measurement.pupil_x, pupil_y: @k_measurement.pupil_y, timestamp: @k_measurement.timestamp, white_to_white: @k_measurement.white_to_white }
    assert_redirected_to k_measurement_path(assigns(:k_measurement))
  end

  test "should destroy k_measurement" do
    assert_difference('KMeasurement.count', -1) do
      delete :destroy, id: @k_measurement
    end

    assert_redirected_to k_measurements_path
  end
end
