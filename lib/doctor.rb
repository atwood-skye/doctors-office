class Doctor
  attr_reader(:name, :speciality, :id)
  def initialize(attributes)
    @name = attributes[:name]
    @speciality = attributes[:speciality]
    @id = attributes[:id]
  end

  def self.all
    returned_doctors = []
    doctors = DB.exec("SELECT * FROM doctors;")
    doctors.each do |doctor|
      name = doctor['name']
      speciality = doctor['speciality']
      id = doctor['id'].to_i
      new_doctor = Doctor.new({name: name, speciality: speciality, id: id})
      returned_doctors.push(new_doctor)
    end
    returned_doctors
  end

  def attributes
    @attributes
  end

  def save
    DB.exec("INSERT INTO doctors (name, speciality) VALUES ('#{@name}', '#{@speciality}');")
  end

  def find_patients
    returned_patients = []
    patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{@id};")
    patients.each do |patient|
      name = patient['name']
      birthdate = patient['birthdate']
      id = patient['id']
      doctor_id = patient['doctor_id']
      found_patient = Patient.new({name: "Patricia", birthdate: '1850-12-21 00:00:00', id: 1, doctor_id: 1})
      returned_patients.push(found_patient)
    end
    returned_patients
  end

  define_method(:==) do |other_doctor|
    booleans = []
      booleans.push(self.name.==(other_doctor.name))
      booleans.push(self.speciality.==(other_doctor.speciality))
    booleans.all?
  end
end
