require "rails_helper"

RSpec.describe "students show page", type: :feature do
  before(:each) do
    @noel = Student.create!(name: 'Noel Sitnick', age: 15, house: 'Ravenclaw')
    @austin = Student.create!(name: 'Austin Moore', age: 20, house: 'Gryffindor')
    @dark_arts = @noel.courses.create!(name: "Defense against the Dark Arts" )
    @herbology = @noel.courses.create!(name: "Herbology" )
    @herbology = @austin.courses.create!(name: "Herbology" )
    @potions = @austin.courses.create!(name: "Potions" )
  end

  scenario "visitor visits show page and sees list of students courses" do
    visit "/students/#{@noel.id}"
    expect(current_path).to eq("/students/#{@noel.id}")
    expect(page).to have_content(@dark_arts.name)
    expect(page).to have_content(@herbology.name)
    expect(page).to_not have_content(@potions.name)
  end
end
