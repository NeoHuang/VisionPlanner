json.array!(@patients) do |patient|
  json.extract! patient,:id, :firstname, :lastname, :birth, :gender
 # json.url patient_url(patient, format: :html)

end
