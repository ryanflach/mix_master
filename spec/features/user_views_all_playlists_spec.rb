require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they visit the page for all playlists" do
    playlist = Playlist.create(name: "My Jammies")

    visit playlists_path

    expect(page).to have_link playlist.name, href: playlist_path(playlist)
  end
end
