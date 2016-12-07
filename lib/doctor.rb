class Doctor
  attr_reader(:name, :speciality_id, :id)
  def initialize(attributes)
    @name = attributes[:name]
    @speciality_id = attributes[:speciality_id].to_i
    @id = attributes[:id].to_i
  end

  def self.all
    returned_doctors = []
    doctors = DB.exec("SELECT * FROM doctors ORDER BY name;")
    doctors.each do |doctor|
      name = doctor['name']
      speciality_id = doctor['speciality_id'].to_i
      id = doctor['id'].to_i
      new_doctor = Doctor.new({name: name, speciality_id: speciality_id, id: id})
      returned_doctors.push(new_doctor)
    end
    returned_doctors
  end

  def attributes
    @attributes
  end

  def save
    DB.exec("INSERT INTO doctors (name, speciality_id) VALUES ('#{@name}', '#{@speciality_id}');")
  end

  def set_speciality(new_speciality_id)
    @speciality_id = new_speciality_id.to_i
    DB.exec("UPDATE doctors SET speciality_id = #{@speciality_id} WHERE id = #{@id};")
  end

  def find_patients
    returned_patients = []
    patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{@id} ORDER BY name ASC;")
    patients.each do |patient|
      name = patient['name']
      birthdate = patient['birthdate']
      id = patient['id'].to_i
      doctor_id = patient['doctor_id'].to_i
      found_patient = Patient.new({name: name, birthdate: birthdate, id: id, doctor_id: doctor_id})
      returned_patients.push(found_patient)
    end
    returned_patients
  end

  def ==(other_doctor)
    booleans = []
      booleans.push(self.name == other_doctor.name)
      booleans.push(self.speciality_id == other_doctor.speciality_id)
    booleans.all?
  end
end
