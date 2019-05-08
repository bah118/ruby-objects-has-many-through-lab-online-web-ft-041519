class Patient  
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end

  # given a doctor and date, creates a new appointment belonginng to that patient
  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end
  
  # has many appointments
  def appointments
    Appointment.all.select{|a| a.patient == self}
  end
  
  # has many doctors through appointments
  def doctors
    appointments.collect{|a| a.doctor}
  end
  
  def self.all
    @@all
  end
  
end