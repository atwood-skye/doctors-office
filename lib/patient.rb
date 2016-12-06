class Patient
  attr_reader(:name, :birthdate, :doctor_id, :id)
  def initialize(attributes)
    @name = attributes[:name]
    @birthdate = attributes[:birthdate]
    @id = attributes[:id]
    @doctor_id = attributes[:doctor_id]
  end

  def self.all
    returned_patients = []
    patients = DB.exec("SELECT * FROM patients;")
    patients.each do |patient|
      name = patient['name']
      birthdate = patient['birthdate']
      id = patient['id'].to_i
      doctor_id = patient['doctor_id']
      new_patient = Patient.new({name: name, birthdate: birthdate, id: id, doctor_id: doctor_id})
      returned_patients.push(new_patient)
    end
    returned_patients
  end

  def save
    DB.exec("INSERT INTO patients (name, birthdate) VALUES ('#{@name}', '#{@birthdate}');")
  end

  def set_doctor(new_doctor_id)
    @doctor_id = new_doctor_id
    DB.exec("UPDATE patients SET doctor_id = #{@doctor_id} WHERE id = #{@id};")
  end

  def self.find(find_id)
    returned_patients = []
    patients = DB.exec("SELECT * FROM patients WHERE id = #{find_id}")
    patients.each do |patient|
      name = patient['name']
      birthdate = patient['birthdate']
      id = patient['id'].to_i
      doctor_id = patient['doctor_id']
      new_patient = Patient.new({name: name, birthdate: birthdate, id: id, doctor_id: doctor_id})
      returned_patients.push(new_patient)
    end
    returned_patients
  end

  define_method(:==) do |other_patient|
    booleans = []
      booleans.push(self.name.==(other_patient.name))
      booleans.push(self.birthdate.==(other_patient.birthdate))
      booleans.push(self.doctor_id.==(other_patient.doctor_id))
    booleans.all?
  end

end
