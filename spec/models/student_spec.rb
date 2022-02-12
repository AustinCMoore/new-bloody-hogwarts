require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    before(:each) do
      @casseopia = Student.create!(name: 'Casseopia Black', age: 10, house: 'Slytherin')
      @noel = Student.create!(name: 'Noel Sitnick', age: 15, house: 'Ravenclaw')
      @austin = Student.create!(name: 'Austin Moore', age: 22, house: 'Gryffindor')
      @kirsten = Student.create!(name: 'Kirsten Sitnick', age: 25, house: 'Hufflepuff')
    end

    it 'self.average_age'do
      expect(Student.all).to eq([@casseopia, @noel, @austin, @kirsten])
      expect(Student.average_age).to eq(18)
    end
  end
end
