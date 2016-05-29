require 'rails_helper'

RSpec.feature "user can delete a song" do
  scenario "user can delete a song from artist and will get redirected to artist" do
    artist = create(:artist)
    song1 = artist.songs.create(title: "One Love")
    song2 = artist.songs.create(title: "Three Little Birds")

    visit artist_path(artist)
    click_on "View Songs"
    expect(page).to have_link song1.title, href: song_path(song1)
    first(:link, "Delete").click

    expect(current_path).to eq artist_path(artist)

    click_on "View Songs"
    expect(page).to_not have_link song1.title, href: song_path(song1)
  end
end
