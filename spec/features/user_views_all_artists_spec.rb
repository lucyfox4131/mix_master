require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "user can see all artists" do
    artist1 = Artist.create(name: "John Mayer",
    image_path: "http://a5.files.biography.com/image/upload/c_fill,cs_srgb,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MTAyODIxMzg3.jpg" )
    artist2 = Artist.create(name: "Elton John",
    image_path: "http://i4.mirror.co.uk/incoming/article2269664.ece/ALTERNATES/s1200/Elton-John.jpg")

    visit artists_path

    expect(page).to have_content artist1.name
    expect(page).to have_content artist2.name
    expect(page).to have_css("img[src=\"#{artist1.image_path}\"]")
    expect(page).to have_css("img[src=\"#{artist2.image_path}\"]")

  end
end
