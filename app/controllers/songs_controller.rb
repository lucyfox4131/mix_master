class SongsController < ApplicationController

  def index
    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      @songs = @artist.songs.order(:title)
    else
      @songs = Song.all.order(:title)
    end
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @artist = @song.artist
    @song.destroy

    redirect_to artist_path(@artist)
  end


  private

  def song_params
    params.require(:song).permit(:title)
  end
end
