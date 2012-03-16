# myapp.rb
require 'sinatra'
require 'sinatra/respond_to'
require 'json'
require 'haml'

Sinatra::Application.register Sinatra::RespondTo

get '/' do
  'Hello world!'
end

get '/hello/:name' do
  return_value = {:name => params[:name]}
  respond_to do |wants|
    wants.html { haml :hello, :locals => return_value }
    wants.json { return_value.to_json }
  end
end