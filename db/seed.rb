require 'active_record'
ActiveRecord::Base.establish_connection({
	database: 'tunr_db',
	adapter: 'postgresql'
})

# models
require_relative '../models/song.rb'
require_relative '../models/artist.rb'
require_relative '../models/playlist.rb'

# data
require_relative './song_data.rb'
require_relative './artist_data.rb'

# Start from scratch
Song.destroy_all
Playlist.destroy_all
Artist.destroy_all

song_data = get_song_data()
artist_data = get_artist_data()

song_data.each_pair do |artist_name, songs|

	info = artist_data[artist_name]
	artist = Artist.create!(info)

	songs.each do |song|
		Song.create!({
			title:       song[:title],
			album:       song[:album],
			preview_url: song[:preview_link],
			artist:      artist,
			artwork: song[:artwork]
		})
	end
end

playlist_names = ['WorkoutJamz', 'SuiteTunes', 'JockJamz', 'Chilltopia']

playlist_names.each do |playlist_name|
	playlist = Playlist.create!(name: playlist_name)
	playlist.songs = Song.all.sample(10)
end
