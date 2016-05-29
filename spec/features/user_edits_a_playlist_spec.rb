require 'rails_helper'

RSpec.feature "user_can_edit_a_playlist" do
  scenario "they see the updated data for the individual playlist" do
    playlist             = create(:playlist)
    first = playlist.songs.create(title: "First Song")
    second = playlist.songs.create(title: "Second Song")
    third = playlist.songs.create(title: "Third Song")
    new_song             = create(:song, title: "New Song")

    visit playlist_path(playlist)
    click_on "Edit"
    uncheck("song-#{first.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content playlist.name
    expect(page).to_not have_content first.title
    expect(page).to have_content new_song.title
  end
end
