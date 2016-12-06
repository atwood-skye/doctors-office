require 'spec_helper.rb'

describe 'Doctor' do
  describe '.all' do
    it 'will return an empty array to start' do
      new_doctor = Doctor.new({name: "Carlos", speciality: "Rhinoplasty", id: nil})
      expect(Doctor.all).to eq([])
    end
  end
end
