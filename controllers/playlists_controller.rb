get '/playlists' do 
  @playlists = Playlist.all
  erb :'playlists/index'
end
 
get '/playlists/new' do 
  erb :'playlists/new'
end
get '/playlists/:id' do 
  @playlist = Playlist.find(params[:id])
  erb :'playlists/show'
end
 
get '/playlists/:id/edit' do
  @playlist = Playlist.find(params[:id])
  @songs = Song.all
  erb :'playlists/edit'
end
 
put '/playlists/:id' do
  playlist = Playlist.find(params[:id])
  playlist.update(params[:playlist])
  redirect "/playlists/#{playlist.id}"
end
 
delete '/playlists/:id' do
  playlist = Playlist.find(params[:id])
  if playlist.destroy
    redirect '/playlists'
  else
    redirect "/playlists/#{playlist.id}"
  end
end
 
post '/playlists/:id/add_song' do
  playlist = Playlist.find(params[:id])
  song = Song.find(params[:song_id])
  playlist.songs.push(song)
  redirect "/playlists/#{playlist.id}"
end
 
post '/playlists/:id/remove_song' do
  playlist = Playlist.find(params[:id])
  song = Song.find(params[:song_id])
  playlist.songs.destroy(song)
  redirect "/playlists/#{playlist.id}"
end