require 'sinatra'
require 'sinatra/contrib/all'
require_relative './schemas/TileSchema'
require_relative './models/tile'
also_reload 'models/*'

get '/' do
  erb :index
end

before do
   content_type :json
end

get '/api/tiles' do
  TileSchema.dump_all Tile.all
end

get '/api/tiles/:id' do
  TileSchema.dump Tile.find params[:id]
end
