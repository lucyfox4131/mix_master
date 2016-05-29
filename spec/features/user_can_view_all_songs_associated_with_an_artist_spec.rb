require 'rails_helper'

RSpec.feature "user sees all songs for an artist" do
  scenario "user views all songs for an artist" do
    artist = create(:artist)
    song2 = artist.songs.create(title: "Three Little Birds")
    song1 = artist.songs.create(title: "One Love")

    visit artist_path(artist)
    click_on "View Songs"
    expect(page).to have_link song1.title, href: song_path(song1)
    expect(page).to have_link song2.title, href: song_path(song2)
  end
end
