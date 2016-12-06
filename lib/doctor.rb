class Doctor
  attr_reader(:name, :speciality)
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

  define_method(:==) do |other_doctor|
    booleans = []
      booleans.push(self.name.==(other_doctor.name))
      booleans.push(self.speciality.==(other_doctor.speciality))
    booleans.all?
  end
end
