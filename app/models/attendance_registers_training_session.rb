class AttendanceRegistersTrainingSession < ActiveRecord::Base
  belongs_to :gardener
  belongs_to :attendance_register
end
