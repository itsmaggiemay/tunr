# INDEX
get '/artists' do
  @artists = Artist.all
  erb :'artists/index'
end
 
# CREATE
post '/artists' do
  artist = Artist.new(params[:artist])
  if artist.save 
    redirect("/artists/#{artist.id}") 
  else
    redirect("/artists/new")
  end
end
 
# NEW
get '/artists/new' do
  erb :'/artists/new'
end
 
# SHOW
get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :'artists/show'
end
 
# EDIT
get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :'artists/edit'
end
 
# UPDATE
put '/artists/:id' do
  artist = Artist.find(params[:id])
  if artist.update(params[:artist])
    redirect("/artists/#{artist.id}")
  else
    redirect("/artists/#{artist.id}/edit")
  end
end
 
# DESTROY
delete '/artists/:id' do
  artist = Artist.find(params[:id])
  if artist.destroy
    redirect('/artists')
  else
    redirect("/artists/#{artist.id}")
  end
end