class Doctor
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  # given a date and a patient, creates a new appointment
  def new_appointment(date, patient)
    Appointment.new(date, patient, self)
  end
  
  # has many appointments
  def appointments
    Appointment.all.select{|a| a.doctor == self}
  end
  
  # has many patients, through appointments
  def patients
    x = appointments.collect{|a| a.patient}
    x
  end
  
  def self.all
    @@all
  end
  
end
