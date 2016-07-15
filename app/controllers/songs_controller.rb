class SongsController < ApplicationController
  def new
    @artist = artist_for_page
    @song = @artist.songs.new
  end

  def create
    @artist = artist_for_page
    @song = @artist.songs.create(song_params)

    redirect_to song_path(@song)
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def artist_for_page
    Artist.find(params[:artist_id])
  end
end
