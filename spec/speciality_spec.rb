require 'spec_helper.rb'

describe 'Speciality' do
  describe '.all' do
    it 'will return an empty array to start' do
      new_doctor = Speciality.new({speciality: "Carlos", id: nil})
      expect(Speciality.all).to eq([])
    end
  end

  describe '#save' do
    it 'will save a new doctor to the database' do
      new_doctor = Speciality.new({speciality: "Carlos", id: nil})
      new_doctor.save
      expect(Speciality.all).to eq([new_doctor])
    end
  end

  describe "#=="  do
    it "is the same task if it has the same attributes" do
      task1 = Speciality.new({:speciality => "Carlos", id: 1})
      task2 = Speciality.new({:speciality => "Carlos", id: 1})
      expect(task1).to(eq(task2))
    end
  end

  describe "#find_doctors" do
    it "finds the doctors assigned to the selected speciality" do
      new_speciality = Speciality.new({speciality: "Carlos", id: 1})
      new_doctor = Doctor.new({:name => "Carlos", :speciality_id => 1, :id => 1})
      new_doctor.save
      new_doctor = Doctor.all[0]
      new_doctor.set_speciality(1)
      expect(new_speciality.find_doctors).to eq([new_doctor])
    end
  end
end
