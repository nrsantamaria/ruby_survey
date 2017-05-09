require "sinatra"
require "sinatra/reloader"
require "./lib/Survey"
require "pry"

also_reload "lib/**/*.rb"

get "/" do
  erb :index
end
