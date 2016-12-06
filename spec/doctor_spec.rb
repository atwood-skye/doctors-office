require 'spec_helper.rb'

describe 'Doctor' do
  describe '.all' do
    it 'will return an empty array to start' do
      new_doctor = Doctor.new({name: "Carlos", speciality: "Rhinoplasty", id: nil})
      expect(Doctor.all).to eq([])
    end
  end

  describe '#save' do
    it 'will save a new doctor to the database' do
      new_doctor = Doctor.new({name: "Carlos", speciality: "Rhinoplasty", id: nil})
      new_doctor.save
      expect(Doctor.all).to eq([new_doctor])
    end
  end

  describe "#=="  do
    it "is the same task if it has the same attributes" do
      task1 = Doctor.new({:name => "Carlos", :speciality => 'Rhinoplasty'})
      task2 = Doctor.new({:name => "Carlos", :speciality => 'Rhinoplasty'})
      expect(task1).to(eq(task2))
    end
  end

  describe "#find_patients" do
    it "finds the patients assigned to the selected doctor" do
      new_doctor = Doctor.new({name: "Carlos", speciality: "Rhinoplasty", id: 1})
      new_patient = Patient.new({name: "Patricia", birthdate: '1850-12-21 00:00:00', id: 1, doctor_id: 1})
      new_patient.save
      new_patient = Patient.all[0]
      new_patient.set_doctor(1)
      expect(new_doctor.find_patients).to eq([new_patient])
    end
  end
end
