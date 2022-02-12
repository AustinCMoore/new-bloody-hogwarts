# As a visitor,
# When I visit '/courses'
# I see a list of courses and the number of students enrolled in each course.
#
# (e.g. "Defense Against the Dark Arts: 5"
#       "Herbology: 10")
require "rails_helper"

RSpec.describe "courses index page", type: :feature do
  before(:each) do
    @dark_arts = Course.create!(name: "Defense against the Dark Arts" )
    @herbology = Course.create!(name: "Herbology" )
    @potions = Course.create!(name: "Potions" )
    @casseopia = @dark_arts.students.create!(name: 'Casseopia Black', age: 10, house: 'Slytherin')
    @noel = @dark_arts.students.create!(name: 'Noel Sitnick', age: 15, house: 'Ravenclaw')
    @noel = @herbology.students.create!(name: 'Noel Sitnick', age: 15, house: 'Ravenclaw')
    @austin = @herbology.students.create!(name: 'Austin Moore', age: 20, house: 'Gryffindor')
    @kirsten = @herbology.students.create!(name: 'Kirsten Sitnick', age: 25, house: 'Hufflepuff')
    @austin = @potions.students.create!(name: 'Austin Moore', age: 20, house: 'Gryffindor')
  end

  scenario 'visitor visits index page and sees a list of courses and num of students' do
    visit '/courses'
    expect(current_path).to eq('/courses')
    expect(page).to have_content(@dark_arts.name)
    expect(page).to have_content("Qty enrolled: 2")
    expect(page).to have_content(@herbology.name)
    expect(page).to have_content("Qty enrolled: 3")
    expect(page).to have_content(@potions.name)
    expect(page).to have_content("Qty enrolled: 1")
  end
end
