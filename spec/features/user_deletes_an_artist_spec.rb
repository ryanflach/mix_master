require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they see the page for an individual artist" do
    artist = create(:artist)

    visit artist_path(artist)

    click_on "Delete"

    expect(current_path).to eq artists_path
    expect(page).not_to have_content artist.name
  end
end
