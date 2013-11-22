class Patient < ActiveRecord::Base
  has_many :k_measurements
				def Patient.convertGender(intGender)
								case intGender
								when 0
												"Male"
								when 1
												"Female"
								else
												"Unknown"
								end

				end
        def Patient.getGenderImg(intGender)
          case intGender
          when 0
            "/assets/male.png"
          when 1
            "/assets/female.png"
          else
            "/assets/unknowGender.png"
          end
        end
end
