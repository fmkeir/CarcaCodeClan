require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/tile')
also_reload('models/*')

get '/' do
  erb(:index)
end

before do
   content_type :json
end

get '/api/tiles' do
  @tiles = Tile.all()
  @tiles.to_json()
end

get '/api/tiles/:id' do
  @tile = Tile.find(params[:id])
  @tile.to_json()
end
