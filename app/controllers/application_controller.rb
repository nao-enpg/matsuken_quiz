class ApplicationController < ActionController::Base
    before_action :set_locale

    def default_url_options
        { locale: I18n.locale }
    end

    private

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
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
