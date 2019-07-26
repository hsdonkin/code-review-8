require('pry')
require('sinatra')
require('sinatra/reloader')
require('./lib/dictionary')
also_reload('./lib/**/*.rb')

get ('/') do
  "this is the homepage"
end
