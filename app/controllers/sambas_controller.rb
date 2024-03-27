class SambasController < ApplicationController
  before_action :set_songs_options, only: [:index, :check_answer]
  before_action :set_random_song, only: [:index, :check_answer, :show_result]

  def index
    session[:random_song_id] = @random_song.id
  end

  def check_answer
    correct_song_id = session[:random_song_id]
    session[:correct] = params[:song_id] == correct_song_id.to_s
    redirect_to action: :show_result
  end

  def show_result
    @correct = session[:correct]
  end

  private

  def set_songs_options
    @songs_options = Samba.all
  end

  def set_random_song
    unless ['check_answer', 'show_result'].include?(action_name)
      @random_song = Samba.order("RANDOM()").first
      @preview_url = @random_song.preview_url
      session[:random_song_id] = @random_song.id
    else
      @random_song = Samba.find(session[:random_song_id])
      @preview_url = @random_song.preview_url
    end
  end
end