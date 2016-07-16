class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update]
  
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
  end

  def edit
  end

  def update
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

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end
end
