require 'xmlsimple'
gps = XmlSimple.xml_in('e:/T_OS_1999-01-01_20130215140430.gps', {'KeyAttr' => 'name'})

k_measurement = {}
patient = {};
patient['firstname'] = gps['GeneralData'][0]['Patient'][0]['firstName']
patient['lastname']= gps['GeneralData'][0]['Patient'][0]['lastName']
birthStr = gps['GeneralData'][0]['Patient'][0]['Birthday'][0]['value']
patient['birth'] = Date.strptime(birthStr, "%d/%m/%Y")
patient['gender'] = 0


gps['Module'].each do |m|
  if m['type'] == 'Diagnostic'
    eye = m['Eye'][0]
    p eye['type']
    limbus = eye['Limbus'][0]
    pupil = eye['Pupil'][0]
    cr = eye['Purkinje'][0]
    meridians = eye['Meridian']
    meridians.each do |meridian|
      if meridian['type'] == 'steep'
        k_measurement['k1'] = meridian['Curvature'][0]['value'].to_f
        k_measurement['axis'] = meridian['Axis'][0]['value'].to_f
      else
        k_measurement['k2'] = meridian['Curvature'][0]['value'].to_f
      end
    end

    if nil != limbus
      size = limbus['Size'][0]
      k_measurement['limbus_rx'] = size['rMajor'].to_f
      k_measurement['limbus_ry'] = size['rMinor'].to_f

      center = limbus['Center'][0]
      k_measurement['limbus_x'] = center['x'].to_f
      k_measurement['limbus_y'] = center['y'].to_f

      k_measurement['limbus_q'] = limbus['Quality'][0]['value'].to_f
    end

    if nil != pupil
      size = pupil['Size'][0]
      k_measurement['pupil_rx'] = size['rMajor'].to_f
      k_measurement['pupil_ry'] = size['rMinor'].to_f

      center = pupil['Center'][0]
      k_measurement['pupil_x'] = center['x'].to_f
      k_measurement['pupil_y'] = center['y'].to_f

      quality = pupil['Quality'][0]['value'].to_f
      k_measurement['pupil_q'] = quality

    end
    if nil != cr
      position = cr['Position'][0]
      k_measurement['cr_x'] = position['x'].to_f
      k_measurement['cr_y'] = position['y'].to_f


      quality = cr['Quality'][0]['value'].to_f
      k_measurement['cr_q'] = quality

    end
  end
end
k_measurement['image'] = 'fullData_OS_xml.gps_preop_0_0.jpg'
exist = Patient.find_by firstname: patient['firstname'], lastname: patient['lastname']
if nil == exist
  exist = Patient.new(patient)
  exist.save
end
k_measurement['patient_id'] = exist.id

newMeasurment = KMeasurement.new(k_measurement)
newMeasurment.save


