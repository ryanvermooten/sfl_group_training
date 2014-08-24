class TrainingSessions < ActiveRecord::Migration
  def change
  	create_table "training_sessions", force: true do |t|
    t.integer  "attendance_registers_id"
    t.string   "name"
    t.integer  "date_held"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  end
end
