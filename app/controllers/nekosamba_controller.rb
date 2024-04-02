class NekosambaController < ApplicationController
  before_action :set_songs_options, only: [:index, :check_answer]
  before_action :set_random_song, only: [:index, :check_answer, :show_result]

  def index
    if session[:reset_session]
      session[:continuous_correct_answers] = 0
      session[:reset_session] = nil
    end
    session[:random_song_id] = @random_song.id
    session[:continuous_correct_answers] ||= 0
  end

  def check_answer
    if params[:song_id].blank?
      flash[:alert] = I18n.t('nekosamba.please_select_song')
      redirect_to action: :index
    else
      correct_song_id = session[:random_song_id]
      if params[:song_id] == correct_song_id.to_s
        session[:continuous_correct_answers] += 1
        session[:correct] = true
      else
        session[:correct] = false
        session[:reset_session] = true
      end
      redirect_to action: :show_result
    end
  end

def show_result
  @correct = session[:correct]
  @count = session[:continuous_correct_answers]

  @share_text = "#{t('neko_result.consecutive_correct', count: @count)}"
end


  private

  def set_songs_options
    @songs_options = Samba.order("RANDOM()")
  end
end
