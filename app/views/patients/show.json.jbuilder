json.extract! @patient, :firstname, :lastname, :birth, :gender, :created_at, :updated_at
json.measurements(@patient.k_measurements) do |json, measurement|
  json.extract! measurement,:id, :k1, :axis, :k2, :limbus_rx, :pupil_rx
  json.image APP_CONFIG['image_data_root'] + measurement.image
 # json.url patient_url(patient, format: :html)

end
