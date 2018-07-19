require 'sinatra/base'

class App < Sinatra::Base
set :views, Proc.new { File.join(root, "../views/") }
    
  get '/' do
    erb :form
  end

  get '/new' do
    erb :'pirates/new'
  end


post '/pirates' do
  @pirate = Pirate.new(params[:pirate])
  params[:pirate][:ships].each do |details|
  Ship.new(details)
end
@ships = Ship.all
erb :'pirates/show'
end


end
