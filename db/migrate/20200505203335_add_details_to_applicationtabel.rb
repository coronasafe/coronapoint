class AddDetailsToApplicationtabel < ActiveRecord::Migration[6.0]
  def change
    add_column :applications, :age, :int
    add_column :applications, :police_station, :string
    add_column :applications, :state, :string
    add_column :applications, :district, :string
    add_column :applications, :village, :string
    add_column :applications, :status, :string
    add_column :vehicles, :name_of_driver, :string
    add_column :vehicles, :phone, :string
    add_column :vehicles, :mode, :string
    remove_index :contacts, :phone
  end
end
