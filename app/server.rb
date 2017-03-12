require 'sinatra'
require 'pony'

set :public_dir, Proc.new { File.join(root, "..", "public") }

get '/' do
  erb :index
end

get '/klel' do
  erb :klel
end

get '/mobileluv' do
  erb :mobileluv
end

get '/qz' do
  erb :qz
end

post '/qz' do
  params[:name]
end


get '/gif' do
  erb :gif
end