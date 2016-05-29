require 'rails_helper'

RSpec.feature "user sees all playlists" do
  scenario "user can see links to each playlist" do
    playlist1 = Playlist.create(name: "Fun Times")
    playlist2 = Playlist.create(name: "Summer Jamz")

    visit playlists_path

    expect(page).to have_link playlist1.name, href: playlist_path(playlist1)
    expect(page).to have_link playlist2.name, href: playlist_path(playlist2)

  end
end
