require 'rails_helper'

RSpec.feature "user edits an artist" do
  scenario "user edits an artist" do
    artist1 = Artist.create(name: "John Mayer",
    image_path: "http://a5.files.biography.com/image/upload/c_fill,cs_srgb,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MTAyODIxMzg3.jpg" )

    visit artist_path(artist1)

    click_on "Edit artist"

    fill_in "artist_name", with: "Skrillex"

    click_on "Update Artist"

    expect(page).to have_content "Skrillex"
    expect(page).to_not have_content "John Mayer"
    expect(page).to have_css("img[src=\"#{artist1.image_path}\"]")
  end
end
