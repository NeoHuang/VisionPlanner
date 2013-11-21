class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.date :birth
      t.integer :gender

      t.timestamps
    end
  end
end
