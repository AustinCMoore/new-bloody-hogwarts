require "rails_helper"

RSpec.describe "students index page", type: :feature do
  before(:each) do
    @casseopia = Student.create!(name: 'Casseopia Black', age: 10, house: 'Slytherin')
    @noel = Student.create!(name: 'Noel Sitnick', age: 15, house: 'Ravenclaw')
    @austin = Student.create!(name: 'Austin Moore', age: 20, house: 'Gryffindor')
    @kirsten = Student.create!(name: 'Kirsten Sitnick', age: 25, house: 'Hufflepuff')
  end

  scenario "visitor visits index page and sees list of students names, ages, houses" do
    visit '/students'
    expect(current_path).to eq('/students')
    expect(page).to have_content(@casseopia.name)
    expect(page).to have_content(@casseopia.age)
    expect(page).to have_content(@casseopia.house)
    expect(page).to have_content(@noel.name)
    expect(page).to have_content(@noel.age)
    expect(page).to have_content(@noel.house)
  end
end
