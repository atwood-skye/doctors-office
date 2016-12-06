class Speciality
  attr_reader(:speciality, :id)
  def initialize(attributes)
    @speciality = attributes[:speciality]
    @id = attributes[:id]
  end

  def self.all
    returned_specialities = []
    specialities = DB.exec("SELECT * FROM specialities;")
    specialities.each do |current_speciality|
      speciality = current_speciality['speciality']
      id = current_speciality['id'].to_i
      new_speciality = Speciality.new({speciality: speciality, id: id})
      returned_specialities.push(new_speciality)
    end
    returned_specialities
  end

  def save
    DB.exec("INSERT INTO specialities (speciality) VALUES ('#{@speciality}');")
  end

  def find_doctors
    returned_doctors = []
    doctors = DB.exec("SELECT * FROM doctors WHERE speciality_id = #{@id};")
    doctors.each do |doctor|
      name = doctor['name']
      id = doctor['id']
      speciality_id = doctor['speciality_id']
      found_doctor = Doctor.new({name: name, id: id, speciality_id: speciality_id})
      returned_doctors.push(found_doctor)
    end
    returned_doctors
  end

  define_method(:==) do |other_speciality|
    booleans = []
      booleans.push(self.speciality.==(other_speciality.speciality))
    booleans.all?
  end
end
