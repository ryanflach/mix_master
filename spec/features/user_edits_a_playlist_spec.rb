require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they view the page for an individual playlist" do
    playlist = Playlist.create(name: "My Jamz")
    song = create(:song)
    playlist.songs << song
    other_song, another_song = create_list(:song, 2)

    visit playlist_path(playlist)

    click_on "Edit"
    new_name = "New Jamz"
    fill_in "playlist_name", with: new_name
    check("song-#{another_song.id}")
    uncheck("song-#{song.id}")
    click_on "Update Playlist"

    expect(page).to have_content new_name
    expect(page).to have_link another_song.title, href: song_path(another_song)
    expect(page).not_to have_content song.title
  end
end
