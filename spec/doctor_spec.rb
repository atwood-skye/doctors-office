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
end
