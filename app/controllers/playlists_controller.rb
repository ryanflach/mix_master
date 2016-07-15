class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to @playlist
    else
      render :new
    end
  end

  def show
    @playlist = playlist_for_page
  end

  def edit
    @playlist = playlist_for_page
  end

  def update
    @playlist = playlist_for_page
    if @playlist.update_attributes(playlist_params)
      redirect_to @playlist
    else
      render :edit
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

  def playlist_for_page
    Playlist.find(params[:id])
  end
end
