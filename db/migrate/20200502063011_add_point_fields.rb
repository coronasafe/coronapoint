class AddPointFields < ActiveRecord::Migration[6.0]
  def change
    change_table(:applications) do |t|
       t.string :full_name
       t.string :address
       t.string :phone
       t.string :aadhar
       t.boolean :quaratine_is_over
       t.date :when_quarantine_over
       t.date :date_of_medical_exam
       t.string :disease_remarks
       t.string :route
       t.string :purpose_of_trip
       t.string :type_of_vehicle
       t.integer :number_of_vehicles
       t.string :private_vehicle_details
       t.integer :total_persons
    end
  end
end
