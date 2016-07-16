class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]
  before_action :set_artist, only: [:new, :create]

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
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

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
