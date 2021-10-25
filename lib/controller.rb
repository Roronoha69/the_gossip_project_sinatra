require 'gossip'
require 'pry'
require 'sinatra'

class ApplicationController < Sinatra::Base

  # --> Route de l'index.erb
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  # --> Route d'un nouveau gossip
  get '/gossips/new/' do
    erb :new_gossip
  end
  # --> Créer un nouveau potin et le sauvegarde 
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
  # --> Route des differents potins, le id change en fonction du numéro de potin
  get '/gossips/:id' do
    erb :gossip, locals: {id: params[:id].to_i, gossips: Gossip.find(params[:id].to_i)}
  end
  # --> Route de modification d'un ancien potin mais garde le meme numéro
  get '/gossips/:id/edit/' do
    erb :edit, locals: {gossip: Gossip.all[params[:id].to_i], id: params[:id].to_i}
  end
  # --> Enregistre la modification
  post '/gossips/:id/edit/' do
    Gossip.update(params["gossip_author"], params["gossip_content"],params[:id].to_i)
    redirect '/'
  end

end
