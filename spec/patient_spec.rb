require 'spec_helper.rb'

describe 'Patient' do
  describe '.all' do
    it 'will return an empty array to start' do
      new_patient = Patient.new({name: "Patricia", birthdate: '1850-12-21 00:00:00', id: nil, doctor_id: nil})
      expect(Patient.all).to eq([])
    end
  end

  describe '.find' do
    it 'will set a find a patient by id' do
      new_patient = Patient.new({name: "Patricia", birthdate: '1850-12-21 00:00:00', id: nil, doctor_id: nil})
      new_patient.save
      id = Patient.all[0].id
      expect(Patient.find(id)).to eq([new_patient])
    end
  end

  describe '#save' do
    it 'will save a new patient to the database' do
      new_patient = Patient.new({name: "Patricia", birthdate: '1850-12-21 00:00:00', id: nil, doctor_id: 0})
      new_patient.save
      expect(Patient.all).to eq([new_patient])
    end
  end

  describe '#set_doctor' do
    it 'will set a doctor for a patient' do
      new_patient = Patient.new({name: "Patricia", birthdate: '1850-12-21 00:00:00', id: 1, doctor_id: nil})
      new_patient.save
      new_patient.set_doctor(1)
      expect(new_patient.doctor_id).to eq(1)
    end
  end

  describe "#=="  do
    it "is the same task if it has the same attributes" do
      task1 = Patient.new({:name => "Patricia", :birthdate => '1850-12-21 00:00:00', doctor_id: nil})
      task2 = Patient.new({:name => "Patricia", :birthdate => '1850-12-21 00:00:00', doctor_id: nil})
      expect(task1).to(eq(task2))
    end
  end
end
