class AddAttendanceRegistersGardeners < ActiveRecord::Migration
  def change
  	create_table :attendance_registers_gardeners do |t|
  	  t.integer "attendance_register_id"
    t.integer "gardener_id"
  end
end
end

