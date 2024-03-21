class SambasController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
  before_action :set_songs_options, only: [:index, :check_answer]
  before_action :set_random_song, only: [:index, :check_answer, :show_result] # この行を追加

  def index
    session[:random_song_id] = @random_song.id # 正解の曲IDをセッションに保存
  end

  def check_answer
    correct_song_id = session[:random_song_id]
    session[:correct] = params[:song_id] == correct_song_id.to_s # 正解情報をセッションに保存
    redirect_to action: :show_result # リダイレクト
  end

  def show_result # このアクションを追加
    @correct = session[:correct] # 正解情報をセッションから取得
  end


  private

  def set_songs_options
    @songs_options = Samba::Samba_IDS.map do |track_id|
      RSpotify::Track.find(track_id)
    end
  end

  def set_random_song
    unless ['check_answer', 'show_result'].include?(action_name) # check_answerアクションとshow_resultアクションの時は新しい曲をセットしない
      random_track_id = Samba::Samba_IDS.sample
      @random_song = RSpotify::Track.find(random_track_id)
      session[:random_song_id] = random_track_id  # 新しい曲のIDをセッションに保存
    else
      @random_song = RSpotify::Track.find(session[:random_song_id]) # セッションに保存されている曲をセット
    end
  end
end
