namespace :precache do
    desc "Precache song preview URLs"
    task cache_songs: :environment do
      Samba::Samba_IDS.each do |track_id|
        song = RSpotify::Track.find(track_id)
        Rails.cache.fetch("songs/#{song.id}/preview_url", expires_in: 1.month) do
          song.preview_url
        end
      end
    end
  end