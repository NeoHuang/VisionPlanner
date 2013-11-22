class AddRefractiveIndexToKMeasurements < ActiveRecord::Migration
  def change
    add_column :k_measurements, :refractive_index, :float
  end
end
