class SambasController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
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
    @songs_options = Samba::Samba_IDS.map do |track_id|
      RSpotify::Track.find(track_id)
    end
  end

  def set_random_song
    unless ['check_answer', 'show_result'].include?(action_name)
      random_track_id = Samba::Samba_IDS.sample
      @random_song = RSpotify::Track.find(random_track_id)
      @preview_url = fetch_preview_url(@random_song) # 変更: @preview_urlインスタンス変数に格納
      session[:random_song_id] = random_track_id
    else
      @random_song = RSpotify::Track.find(session[:random_song_id])
      @preview_url = fetch_preview_url(@random_song) # 変更: @preview_urlインスタンス変数に格納
    end
  end

  def fetch_preview_url(song)
    Rails.cache.fetch("songs/#{song.id}/preview_url", expires_in: 2.months) do
      song.preview_url
    end
  end
end
