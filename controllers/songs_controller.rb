# ===============
#      Songs
# ===============

# INDEX
get '/songs' do
	@songs = Song.all
	erb :'songs/index'
end

# NEW
get '/songs/new' do
  @artists = Artist.all
	erb :'/songs/new'
end

# SHOW
get '/songs/:id' do
	@song = Song.find(params[:id])
	erb :'songs/show'
end

# CREATE
post '/songs' do
	song = Song.new(params[:song])
	if song.save
		redirect("/songs/#{song.id}")
	else
		redirect("/songs/new")
	end
end

# EDIT
get '/songs/:id/edit' do
	@song = Song.find(params[:id])
  @artists = Artist.all
	erb :'songs/edit'
end

# UPDATE
put '/songs/:id' do
	song = Song.find(params[:id])
	if song.update(params[:song])
		redirect("/songs/#{song.id}")
	else
		redirect("/songs/#{song.id}/edit")
	end
end

# DESTROY
delete '/songs/:id' do
	song = Song.find(params[:id])
	if song.destroy
		redirect('/songs')
	else
		redirect("/songs/#{song.id}")
	end
end
