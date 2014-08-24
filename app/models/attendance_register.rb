class AttendanceRegister < ActiveRecord::Base
  belongs_to :group
  accepts_nested_attributes_for :group
  has_many :attendance_registers_training_sessions
  has_many :gardeners, through: :attendance_registers_training_sessions
  belongs_to :training_session
end
