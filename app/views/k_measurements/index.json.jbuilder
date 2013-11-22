json.array!(@k_measurements) do |k_measurement|
  json.extract! k_measurement, :timestamp, :k1, :k2, :axis, :white_to_white, :pupil_x, :pupil_y, :pupil_rx, :pupil_ry, :pupil_q, :limbus_x, :limbus_y, :limbus_rx, :limbus_ry, :limbus_q, :cr_x, :cr_y, :cr_q, :patient_id
  json.url k_measurement_url(k_measurement, format: :json)
end
