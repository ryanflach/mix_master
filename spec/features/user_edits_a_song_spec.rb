require 'rails_helper'

RSpec.feature "User edits an existing song" do
  scenario "they view a songs individual page" do
    artist = create(:artist)
    song = artist.songs.create(title: "No Woman No Cry")

    visit song_path(song)

    song_title = "Redemption Song"

    click_on "Edit"
    fill_in "song_title", with: song_title
    click_on "Update Song"

    expect(current_path).to eq song_path(song)
    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
