class AddToPassengers < ActiveRecord::Migration[6.0]
  def change
    change_table(:contacts) do |t|
      t.boolean :aarogya_setu_downloaded
      t.boolean :doctor_certificate
      t.string :doctor_name
    end
  end
end
