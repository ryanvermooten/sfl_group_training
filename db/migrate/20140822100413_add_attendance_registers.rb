class AddAttendanceRegisters < ActiveRecord::Migration
  def change
  	create_table :attendance_registers do |t|
  	t.integer  "training_session_id"
    t.boolean  "attended"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end
end
end
