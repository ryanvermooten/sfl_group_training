class TrainingSession < ActiveRecord::Base
  has_and_belongs_to_many :attendance_registers
  has_many :addentacies
  
end
