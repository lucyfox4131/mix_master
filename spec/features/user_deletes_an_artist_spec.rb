require 'rails_helper'

RSpec.feature "user deletes an artist" do
  scenario "user can delete an artist" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist2 = Artist.create(name: "Jazzy Jaz", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist1)

    click_on "Delete Artist"

    expect(current_path).to eq artists_path
    expect(page).to_not have_content(artist1.name)
  end
end
