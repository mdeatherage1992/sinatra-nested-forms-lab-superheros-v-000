require 'sinatra/base'

class App < Sinatra::Base
set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :form
  end

post '/heroes' do
  @team = Team.new(params[:team])
  params[:team][:heroes].each do |details|
  Hero.new(details)
end
@teams = Team.all
erb :team
end


end
