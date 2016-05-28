require 'rails_helper'

RSpec.feature "user edits a song" do
  scenario "user is able to edit title of a song" do
    artist = create(:artist)
    song = artist.songs.create(title: "One Love")

    visit song_path(song)
    click_on "Edit"
    fill_in "song_title", with: "Three Little Birds"
    click_on "Update Song"

    expect(page).to have_content "Three Little Birds"
    expect(page).to have_link artist.name, href: artist_path(artist)

  end
end
