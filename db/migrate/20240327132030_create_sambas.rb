class CreateSambas < ActiveRecord::Migration[7.0]
  def change
    create_table :sambas do |t|
      t.string :uri
      t.string :track_name
      t.string :preview_url
      t.string :image_url
      t.string :album_name
      t.string :artist_name
      t.string :track_id
      t.string :spotify_url
      t.string :api_url

      t.timestamps
    end
  end
end
