class AddImageToKMeasurements < ActiveRecord::Migration
  def change
    add_column :k_measurements, :image, :string
  end
end
