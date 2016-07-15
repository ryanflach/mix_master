class PlaylistsController < ApplicationController
  def index
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

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

  def playlist_for_page
    Playlist.find(params[:id])
  end
end
