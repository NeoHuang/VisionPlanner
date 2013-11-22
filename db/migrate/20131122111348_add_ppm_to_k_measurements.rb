class AddPpmToKMeasurements < ActiveRecord::Migration
  def change
    add_column :k_measurements, :ppm, :float
  end
end
