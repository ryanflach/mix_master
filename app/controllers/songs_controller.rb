class SongsController < ApplicationController
  def new
    @artist = artist_for_page
    @song = @artist.songs.new
  end

  def create
    @artist = artist_for_page
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = song_for_page
  end

  def edit
    @song = song_for_page
  end

  def update
    @song = song_for_page
    if @song.update_attributes(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def artist_for_page
    Artist.find(params[:artist_id])
  end

  def song_for_page
    Song.find(params[:id])
  end
end
