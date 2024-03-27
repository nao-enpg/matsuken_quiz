# キャッシュ取得用
require 'rspotify'

Rails.logger.info "RSpotify is authenticating now..."
RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
Rails.logger.info "RSpotify authenticated!"

if ENV['SPOTIFY_CLIENT_ID'].blank? || ENV['SPOTIFY_SECRET_ID'].blank?
    Rails.logger.error "Spotify API keys are missing!"
else
    Rails.logger.info "Spotify API keys are set."
end