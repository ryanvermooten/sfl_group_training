class AddAttendanceRegistersTrainingSessions < ActiveRecord::Migration
  def change
  	create_table :attendance_registers_training_sessions do |t|
  	 t.integer "attendance_register_id"
    t.integer "training_session_id"
    t.integer "gardener_id"
  end
end
end
