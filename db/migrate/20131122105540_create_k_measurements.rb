class CreateKMeasurements < ActiveRecord::Migration
  def change
    create_table :k_measurements do |t|
      t.integer :timestamp
      t.float :k1
      t.float :k2
      t.float :axis
      t.float :white_to_white
      t.float :pupil_x
      t.float :pupil_y
      t.float :pupil_rx
      t.float :pupil_ry
      t.float :pupil_q
      t.float :limbus_x
      t.float :limbus_y
      t.float :limbus_rx
      t.float :limbus_ry
      t.float :limbus_q
      t.float :cr_x
      t.float :cr_y
      t.float :cr_q
      t.integer :patient_id

      t.timestamps
    end
  end
end
